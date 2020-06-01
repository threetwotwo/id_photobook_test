import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:idphotobooktest/services/firestore.dart';

class Auth extends ChangeNotifier {
  final FirebaseUser user;

  static final shared = FirebaseAuth.instance;

  Auth(this.user);

  static Future<FirebaseUser> currentUser() async => shared.currentUser();

  static Stream<FirebaseUser> userStream() => shared.onAuthStateChanged;

  static Future<void> signOut() => shared.signOut();

  static Future<String> recoverPassword(String email) async {
    try {
      await shared.sendPasswordResetEmail(email: email);
    } catch (e) {
      if (e is PlatformException) return e.message;
    }

    return null;
  }

  static Future<String> loginWithEmail(String email, String password) async {
    try {
      await shared.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      if (e is PlatformException) return e.message;
    }

    return null;
  }

  static Future<AuthResult> signUpWithEmail(
      String email, String password) async {
    return shared.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<String> createUser({
    @required String displayName,
    @required String whatsAppNumber,
    String phoneNumber,
    @required String email,
    @required String password,
  }) async {
    try {
      final authResult = await shared.createUserWithEmailAndPassword(
          email: email, password: password);

      if (authResult != null) {
        FirestoreService.createUser(
            user: authResult.user,
            displayName: displayName,
            whatsAppNumber: whatsAppNumber,
            password: password);
        return null;
      }
    } catch (e) {
      if (e is PlatformException)
        return e.message;
      else
        return 'Something went wrong';
    }

    return null;
  }
}
