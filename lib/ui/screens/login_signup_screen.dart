import 'package:flutter/material.dart';
import 'package:idphotobooktest/ui/screens/login_page.dart';
import 'package:idphotobooktest/ui/screens/signup_screen.dart';

class LoginSignUpScreen extends StatefulWidget {
  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  //current sign in mode
  bool isSignIn = true;

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return isSignIn
        ? LoginPage(
            signUpButtonTapped: _changeSignUpMode,
          )
        : SignUpScreen(
            onLoginButtonTapped: _changeSignUpMode,
          );
  }

  void _changeSignUpMode() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }
}
