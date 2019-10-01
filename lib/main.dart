import 'package:easy_toll/screens/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApps());

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyToll',
      theme: ThemeData(
        fontFamily: 'QuickSand',
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}