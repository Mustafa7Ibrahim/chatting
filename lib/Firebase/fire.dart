import 'package:chat_fire/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main () async {
  final FirebaseApp app =await FirebaseApp.configure(
    name: 'firebaseapp',
    options: FirebaseOptions(
      googleAppID: '1:61961353864:android:c87a1a675f84869aad3d3d',
      gcmSenderID: '61961353864',
      apiKey: 'AIzaSyAQahWv7ONwTyqygcawIsiURbLr4oL9mFQ',
      projectID: 'chatting-b91eb',
    )

  );
  final FirebaseStorage storage =FirebaseStorage(app: app,storageBucket: 'gs://chatting-b91eb.appspot.com');
  runApp(MaterialApp(
    home:MyApp(storage: storage),
  )); 
} 
class MyApp extends StatefulWidget{
  MyApp({this.storage});
  final FirebaseStorage storage;

  @override 
  _MyAppState createState()=> _MyAppState(storage: storage);
}
enum FormType {
  login,
  register
}