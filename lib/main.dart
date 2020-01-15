import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _myHomePage(),
    );
  }

  _myHomePage() {
    return Center(
      child: Text(
        "Chat com Firebase",
        style: TextStyle(
          fontSize: 25,
          color: Colors.green,
        ),
      ),
    );
  }
}
