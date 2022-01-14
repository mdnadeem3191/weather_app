import 'package:climate/constant.dart';
import 'package:climate/loading_page.dart';
import 'package:climate/reusable_container.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatefulWidget {
  String? temp;
  String? city;
  String? humidity;
  String? main;
  String? description;
  String? airSpeed;
  String? icon;
  HomePage(
      {Key? key,
      this.airSpeed,
      this.city,
      this.description,
      this.humidity,
      this.icon,
      this.main,
      this.temp})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: NewGradientAppBar(
            gradient: const LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Color(0xFF1565C0), Color(0xFF64B5F6)]),
          ),
          preferredSize: const Size.fromHeight(0)),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue[500],
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF1565C0), Color(0xFF64B5F6)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Container(
            //   margin: const EdgeInsets.only(left: 18),
            //   child: Row(
            //     children: [
            //       TextButton.icon(
            //         onPressed: () {},
            //         label: Text(
            //           "Get Current Location",
            //           style: TextStyle(
            //               color: Colors.white.withOpacity(0.8), fontSize: 20),
            //         ),
            //         icon: Icon(
            //           Icons.location_searching,
            //           color: Colors.white.withOpacity(0.7),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white.withOpacity(0.25),
              ),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchcontroller,
                      decoration: const InputDecoration(
                          hintText: "Enter City Name",
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if ((searchcontroller.text).replaceAll(" ", "") == "") {
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoadingPage(
                                city: searchcontroller.text,
                              ),
                            ));
                      }
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Image.network(
                    'http://openweathermap.org/img/wn/'
                    "${widget.icon}"
                    '@2x.png',
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    //for description container
                    containerHeight: 100,
                    containerChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${widget.description}",
                                style: kContainerText),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                const Text("In ", style: kContainerText),
                                Text(
                                  "${widget.city}",
                                  style: kContainerText.copyWith(
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    containerHeight: 290,
                    containerChild: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              WeatherIcons.thermometer,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 150,
                            ),
                            Text(
                              "Temprature ",
                              style: kContainerText.copyWith(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${widget.temp}',
                              style: kContainerText.copyWith(
                                  fontSize: 100, fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "°",
                              style: kContainerText.copyWith(
                                  fontSize: 60, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "C",
                              style: kContainerText.copyWith(fontSize: 40),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ReusableContainer(
                  containerHeight: 180,
                  containerChild: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            WeatherIcons.wind,
                            size: 22,
                          ),
                          Text(
                            "AirSpeed",
                            style: kContainerText.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        "${widget.airSpeed}",
                        style: kContainerText.copyWith(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                      const Text("Km/hrs")
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableContainer(
                  containerHeight: 180,
                  containerChild: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            WeatherIcons.humidity,
                            size: 22,
                          ),
                          Text(
                            "Humidity",
                            style: kContainerText.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        "${widget.humidity}",
                        style: kContainerText.copyWith(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                      const Text("Percent")
                    ],
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Data Provided By OpenWeatherMap.org",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
