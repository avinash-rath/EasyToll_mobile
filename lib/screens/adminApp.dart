import 'package:easy_toll/screens/ble_demo.dart';
import 'package:flutter/material.dart';

class AdminApp extends StatefulWidget {
  @override
  _AdminAppState createState() => _AdminAppState();
}

class _AdminAppState extends State<AdminApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5.0,
        title: Text(
          'Admin',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: BleDetect(),
    );
  }
}
