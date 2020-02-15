import 'dart:async';

import 'package:chat_fire/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // a constructor of the class
  AuthService({this.uid});

  // uid String
  final String uid;

  // an instance of firebase Auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // an instance of firestore
  final CollectionReference _usersCollection =
      Firestore.instance.collection('users');

  // signUp to a new account using name, email, password
  Future signUp({
    String name,
    String email,
    String password,
    String rePassword,
  }) async {
    if (password == rePassword) {
      try {
        AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        await _usersCollection.document(uid).setData({'userName': name});
        FirebaseUser user = result.user;
        return _userFormFirebaseUser(user);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  //  auth chanage user stream
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map(_userFormFirebaseUser);
  }

  // create a local data of the user form firebase
  User _userFormFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // sign in to firebase using email and password
  Future signIn({String email, String password}) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFormFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }
}
