import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../modle/users.dart';
import 'fireStore.dart';

class FirebaseAuthController {
  FirebaseAuthController._();
  static FirebaseAuthController firebaseAuthHelper = FirebaseAuthController._();
  FirebaseAuth auth = FirebaseAuth.instance;
  Future createAccount(Users user) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
      FirebaseFireStoreHelper.fireStoreHelper.SaveUserData(user, userCredential.user!.uid);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password is too weak");
      } else if (e.code == "email-already-in-use") {
        print("The email already exists for that email");
      } else if (e.code == "invalid-email") {
        print("The email invalid");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserCredential?> signIn(Users users) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: users.email!, password: users.password!);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-disabled") {
        print("The password is too weak");
      } else if (e.code == "user-not-found") {
        print("The email already exists for that email");
      } else if (e.code == "invalid-email") {
        print("The email invalid");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> login(
      String email, String password) async {
    final user = (await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password))
        .user;
    if (user!.emailVerified) {
      return true;
    }
    return false;
  }

  Future resetPassword(Users users) async {
    try {
      await auth.sendPasswordResetEmail(email: users.email!);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    await auth.signOut();
  }

  bool isLoggedIn() {
    return auth.currentUser != null;
  }
}