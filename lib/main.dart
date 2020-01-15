import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MyApp(),
  );

//  print(_mathRandom());
  Firestore.instance
      .collection("Users")
      .document("user_${_mathRandom()}")
      .setData(
    {
      "name": "Gabr Andreatto Alves",
      "email": "gabriel.andreatto.1@gmail.com",
      "idade": 38,
    },
  );
}

_mathRandom() {
  return Random().nextInt(1000);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
