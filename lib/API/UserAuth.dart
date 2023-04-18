import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  final database = FirebaseDatabase.instance; //database reference object
  final storage = firebase_storage.FirebaseStorage.instance;


  Future<String?> signUp(
      {required String email, required String password, required String name}) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      result.user!.updateDisplayName(name);
      // database.ref().child("users").push().set({
      //   "uid": ""+result.user!.uid,
      //   "Address": "",
      //   "Type": "user",
      //   "email": email,
      //   "name": name,
      //   "about": "",
      //   "phone": "",
      //   "notifications": [{"title": "Welcome to this app", "body": "Welcome to our e commerce app"}]
      // }).then((_) {
      // });

      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }


  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString("uid", _firebaseAuth.currentUser!.uid);
      // prefs.setBool("isLoggedIn", true);
      // prefs.setString("Email", email);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}