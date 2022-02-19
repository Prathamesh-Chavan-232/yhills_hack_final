import 'package:chat_app/services/database.dart';
import 'package:chat_app/services/helperfunction.dart';
import 'package:chat_app/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseMethods databaseMethods = DatabaseMethods();
  HelperFunction helperFunction = new HelperFunction();
  QuerySnapshot snapshotUserInfo;
  AuthResult _authResult;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      HelperFunction.saveUserLoggedInSharedPreference(true);
      databaseMethods.getUserByUserEmail(email).then((val) {
        snapshotUserInfo = val;
        HelperFunction.saveUserEmailSharedPreference(
            snapshotUserInfo.documents[0].data['email']);
      });
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      Map<String, String> userInfoMap = {"name": name, "email": email};
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      HelperFunction.saveUserEmailSharedPreference(email);
      HelperFunction.saveUserNameSharedPreference(name);
      databaseMethods.uploadUserInfo(userInfoMap);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
