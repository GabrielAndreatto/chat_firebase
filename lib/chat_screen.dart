import 'dart:core';
import 'dart:io';
import 'package:chat_firebase/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  void _sendMessage({String text, File imageFile}) async {
    Map<String, dynamic> data = {};

    if (imageFile != null) {
      StorageUploadTask task = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(imageFile);

      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      data['url'] = url;
      print(data['url']);
    }

    if (text != null) {
      data['text'] = text;
    }

    data['from'] =
        "Jogador: ${DateTime.now().millisecondsSinceEpoch.toString()}";
    data['status'] = false;
    data['text'] = text;

    Firestore.instance.collection('messages').add(data);
  }
}
