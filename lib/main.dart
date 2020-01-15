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
//      .document()    // sem parametro cria-se id dinamico/unico
      .document("user_${_mathRandom()}")
      .updateData(
    {
      "name": "Gabriel Andreatto Alves",
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
