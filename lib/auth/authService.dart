import 'dart:async';

// import 'package:chat_fire/models/user.dart';
import 'package:chat_fire/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // a constructor of the class
  AuthService({this.currentUser, this.uid});

  // uid String
  final String uid;

  // current user
  FirebaseUser currentUser;

  // Shared Preferences
  SharedPreferences sharedPreferences;

  // context
  BuildContext context;

  // an instance of firebase Auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // an instance of firestore
  final CollectionReference _usersCollection = Firestore.instance.collection(
    'users',
  );

  //  auth chanage user stream
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map(_userFormFirebase);
  }

  // create a local data of the user form firebase
  User _userFormFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // signUp to a new account using name, email, password
  Future signUp({
    String name,
    String email,
    String password,
    String rePassword,
  }) async {
    if (password == rePassword) {
      try {
        sharedPreferences = await SharedPreferences.getInstance();

        AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        FirebaseUser user = result.user;

        if (user != null) {
          // check is already sign up
          final QuerySnapshot result = await _usersCollection
              .where('id', isEqualTo: user.uid)
              .getDocuments();

          final List<DocumentSnapshot> documents = result.documents;

          if (documents.length == 0) {
            // update data to firestore if it's new user
            _usersCollection.document(user.uid).setData({
              'nickname': name,
              'photoUrl': user.photoUrl,
              'id': user.uid,
              'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
              'chattingWith': null,
            });

            // write data to local
            currentUser = user;
            await sharedPreferences.setString(
              'uid',
              currentUser.uid,
            );
            await sharedPreferences.setString(
              'nickname',
              currentUser.displayName,
            );
            await sharedPreferences.setString(
              'photoUrl',
              currentUser.photoUrl,
            );
          } else {
            // Write data to local
            await sharedPreferences.setString(
              'uid',
              documents[0]['id'],
            );
            await sharedPreferences.setString(
              'nickname',
              documents[0]['nickname'],
            );
            await sharedPreferences.setString(
              'photoUrl',
              documents[0]['photoUrl'],
            );
          }
          Fluttertoast.showToast(msg: "Sign Up success");
        }
        return user;
        // _userFormFirebaseUser(user);
      } catch (e) {
        Fluttertoast.showToast(msg: "Sign Up fail ${e.toString()}");
        print(e.toString());
      }
    }
  }

  // sign in to firebase using email and password
  Future signIn({String email, String password}) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      
      if (user != null) {
        final QuerySnapshot result = await _usersCollection
            .where('id', isEqualTo: user.uid)
            .getDocuments();

        final List<DocumentSnapshot> documents = result.documents;

        if (documents.length == 0) {
          currentUser = user;
          await sharedPreferences.setString(
            'uid',
            currentUser.uid,
          );
          await sharedPreferences.setString(
            'nickname',
            currentUser.displayName,
          );
          await sharedPreferences.setString(
            'photoUrl',
            currentUser.photoUrl,
          );
        }
        Fluttertoast.showToast(msg: "Sign In success");
      }
      return user;
      // _userFormFirebaseUser(user);
    } catch (e) {
      Fluttertoast.showToast(msg: "Sign in fail ${e.toString()}");
      print(e.toString());
    }
  }

  // sign out of the app using firebase
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
