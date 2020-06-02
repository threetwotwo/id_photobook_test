import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:idphotobooktest/services/firestore.dart';

class Auth extends ChangeNotifier {
  FirebaseUser user;

  //Factory constructor
  Auth(this.user);

  static final shared = FirebaseAuth.instance;

  void updateUser(FirebaseUser user) {
    this.user = user;
    notifyListeners();
  }

  static Future<FirebaseUser> currentUser() async => shared.currentUser();

  static Stream<FirebaseUser> userStream() => shared.onAuthStateChanged;

  Future<void> signOut() async {
    try {
      await shared.signOut();
      updateUser(null);
    } catch (e) {
      print('Auth.signOut $e');
    }
  }

  static Future<String> recoverPassword(String email) async {
    try {
      await shared.sendPasswordResetEmail(email: email);
    } catch (e) {
      if (e is PlatformException) return e.message;
    }

    return null;
  }

  Future<String> loginWithEmail(String email, String password) async {
    try {
      final result = await shared.signInWithEmailAndPassword(
          email: email, password: password);
      print('Auth.loginWithEmail ${result.user.email}');
      updateUser(result.user);
      return null;
    } catch (e) {
      if (e is PlatformException) {
        print('Auth.loginWithEmail ${e.message}');
        return e.message;
      }
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
