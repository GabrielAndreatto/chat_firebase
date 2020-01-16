import 'package:chat_firebase/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Firebase"),
        centerTitle: true,
        elevation: 0,
      ),
      body: TextComposer(_sendMessage),
    );
  }

  void _sendMessage(String text) {
    Firestore.instance.collection("messages").add({
      "From": "Ronaldinho Gaucho",
      "status": false,
      "text": text,
    });
  }
}
