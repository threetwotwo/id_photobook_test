import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/services/repo.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      onRecoverPassword: (e) => Auth.recoverPassword(e),
      onLogin: (data) => Auth.loginWithEmail(data.name, data.password),
      onSignup: (data) =>
          Repo.createUserWithEmailAndPassword(data.name, data.password),
      theme: LoginTheme(
        primaryColor: AppColors.yellow,
      ),
    );
  }
}
