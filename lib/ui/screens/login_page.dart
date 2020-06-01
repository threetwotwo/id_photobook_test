import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';
import 'package:idphotobooktest/ui/shared/base_text_form_field.dart';
import 'package:idphotobooktest/ui/shared/yellow_button.dart';
import 'package:idphotobooktest/ui/shared/yellow_outline_button.dart';
import 'package:idphotobooktest/ui/widgets/login_action_text.dart';
import 'package:idphotobooktest/utils/validators.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback signUpButtonTapped;
  final VoidCallback passwordResetButtonTapped;

  const LoginPage(
      {Key key, this.signUpButtonTapped, this.passwordResetButtonTapped})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  ///Shows any error message during login
  String _errorMessage;

  bool isLoading = false;

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 35),
              Container(
//                color: Colors.grey,
                height: 135,
                width: 135,
                child: Image.asset(
                  'assets/images/book 1.png',
                ),
              ),
              SizedBox(height: 28),
              Text(
                'Yuk Login ke IDPhotobook!',
                style: Styles.h18ExtraBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28),
              BaseTextFormField(
                controller: emailController,
                validator: (val) => Validators.validateEmail(val),
                title: 'Email Atau No Whatsapp',
                hint: 'Masukan email atau no whatsapp',
              ),
              SizedBox(height: 18),
              BaseTextFormField(
                controller: passwordController,
                validator: (val) => Validators.validatePassLogin(val),
                title: 'Password',
                hint: 'Masukan password',
              ),
              SizedBox(height: 40),
              if (_errorMessage != null)
                Text(
                  _errorMessage ?? '',
                  style: Styles.h14Bold.copyWith(color: Colors.red),
                ),
              YellowButton(
                onTap: _login,
                isLoading: isLoading,
                title: 'Masuk Sekarang',
                padding: const EdgeInsets.all(14),
                textStyle: Styles.h18ExtraBold,
              ),
              SizedBox(height: 15),
              //Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  LoginActionText(
                    questionTitle: 'Belum punya akun?',
                    actionTitle: 'Daftar',
                    onTap: widget.signUpButtonTapped,
                  ),
                  LoginActionText(
                    questionTitle: 'Lupa Password?',
                    actionTitle: 'Reset',
                    onTap: () {},
                  ),
                ],
              ),
              Divider(
                height: 40,
                thickness: 2,
              ),
              Text(
                'Sudah Pernah Pesan?',
                style: Styles.h14Normal,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14),
              YellowOutlineButton(
                onTap: () {},
                title: 'Masuk Dengan Kode Order',
                padding: const EdgeInsets.all(14),
                textStyle: Styles.h18ExtraBold,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _login() async {
    setState(() {
      _errorMessage = null;
    });

    final email = emailController.text;
    final password = passwordController.text;

    //Validate form
    final isValidated = _formKey.currentState.validate();
    if (isValidated) {
      setState(() {
        isLoading = true;
      });
      final result = await Auth.loginWithEmail(email, password);
      setState(() {
        isLoading = false;
        return _errorMessage = result;
      });
    }
  }
}
