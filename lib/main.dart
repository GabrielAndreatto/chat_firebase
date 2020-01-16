import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() async {
  runApp(
    MyApp(),
  );

  DocumentSnapshot snapshot = await Firestore.instance
      .collection("messages")
      .document("2Rc3PAtda1f4iUvRUIig")
      .get();

  print(snapshot.data);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _myHomePage(),
    );
  }

  _myHomePage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Firebase"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text(
        "Chat com Firebase",
        style: TextStyle(
          fontSize: 30,
          color: Colors.green,
        ),
      ),
    );
  }
}
