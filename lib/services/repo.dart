import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/services/firestore.dart';

class Repo {
  static Future<void> createUserOnFirestore(FirebaseUser user) =>
      FirestoreService.createUser(user);

  static Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await Auth.signUpWithEmail(email, password);
      if (result.user != null) createUserOnFirestore(result.user);
      return null;
    } catch (e) {
      if (e is PlatformException) return e.message;
    }
    return null;
  }

  static userStream(String uid) => FirestoreService.userStream(uid);
}
