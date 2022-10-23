// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mytask3/AddList.dart';
import 'package:mytask3/HomeScreen.dart';
import 'package:mytask3/ListScreen.dart';
import 'EditList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScrren(),
        "/list": (context) => ListScreen(),
        "/add": (context) => AddList(),
        "/edit": (context) => EditList(),
      },
    );
  }
}
