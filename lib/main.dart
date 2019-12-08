import 'package:chat_fire/login/log_in.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:io';

final FirebaseAuth _auth =FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _status ;

  void initState(){
    _status='Not Authenticated';

  }

  void _signInAnon ()async{
    FirebaseUser user = await _auth.signInAnonymously();
    
    if(user != null && user.isAnonymous == true){
      setState((){
        _status='Signed in Anonymously';
      });
    }else{
      setState((){
        _status='Sign in failed';
      });
    }
  }

 void _signout() async{
   await _auth.signOut(); 
   setState((){
     _status='Signed out';

   });
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Chat Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Color(0xFFFEF9EB),
            Text:(_status),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(onPressed: _signout,child: Text('Sign out'),),
                RaisedButton(onPressed: _signInAnon,child: Text('Sign Anon'),),

                
              ],
            )

      ),
      
      home: LoginHome(),
    );
  }
}
