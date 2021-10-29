import 'package:flutter/material.dart';
import 'package:weatherflut/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Widget principal where initialize of the app
    return MaterialApp(
      title: 'Weatherflutt',
      theme: ThemeData.light(),
      home: const HomePage(),
    );
  }
}
