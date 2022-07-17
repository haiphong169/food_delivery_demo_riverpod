import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/screens/menu_screen.dart';

mixin FirebaseAuthFunctions {
  var auth = FirebaseAuth.instance;

  void createNewUser(
      String email, String password, BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.popUntil(context, ModalRoute.withName('/'));
      } else {
        Navigator.pushNamed(context, MenuScreen.routeName);
      }
    });
  }

  void signIn(String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }

    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.popUntil(context, ModalRoute.withName('/'));
      } else {
        Navigator.pushNamed(context, MenuScreen.routeName);
      }
    });
  }

  void signOut() async {
    await auth.signOut();
  }
}
