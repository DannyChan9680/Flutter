import 'package:flutter/material.dart';
import 'package:mystocks/HomePage.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
      title: "网易新闻",
      theme: new ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: new Color.fromARGB(255, 0, 215, 198),
        accentColor: Colors.cyan[300],
      ),
      home: new HomePage()));
}      