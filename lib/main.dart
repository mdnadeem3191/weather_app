import 'package:climate/Home_Page.dart';
import 'package:climate/loading_page.dart';
import 'package:flutter/material.dart';
import 'loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoadingPage(),
        '/home': (context) => HomePage()
      },
    );
  }
}
