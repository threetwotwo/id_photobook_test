import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';
import 'package:idphotobooktest/ui/screens/signup_screen.dart';
import 'package:idphotobooktest/ui/shared/base_app_bar.dart';
import 'package:idphotobooktest/ui/shared/yellow_button.dart';
import 'package:idphotobooktest/ui/shared/yellow_outline_button.dart';
import 'package:idphotobooktest/ui/widgets/legacy_text_form_field.dart';
import 'package:idphotobooktest/utils/validators.dart';
import 'package:provider/provider.dart';

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
      appBar: BaseAppBar(
        title: Text('Login'),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 35),
                  Container(
                    height: 135,
                    width: 135,
                    child: Image.asset(
                      'assets/images/book.png',
                    ),
                  ),
                  SizedBox(height: 28),
                  Text(
                    'Yuk Login ke IDPhotobook!',
                    style: Styles.h18ExtraBold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 28),
                  LegacyTextFormField(
                    controller: emailController,
                    label: 'Nomor Whatsapp / Email',
                    hint: 'masukan no whatsapp atau email kakak',
                    validator: (val) => Validators.validateUser(val),
                  ),

                  SizedBox(height: 18),
                  LegacyTextFormField(
                    controller: passwordController,
                    label: 'Password',
                    hint: 'masukan password disini',
                    validator: (val) => Validators.validatePassLogin(val),
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            'Lupa password?',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_errorMessage != null)
                    Text(
                      _errorMessage ?? '',
                      style: Styles.h14Bold.copyWith(color: Colors.red),
                    ),
                  YellowButton(
                    onTap: () {
                      _login();
                    },
                    isLoading: isLoading,
                    title: 'Masuk Sekarang',
                    padding: const EdgeInsets.all(8),
                    textStyle: TextStyle(),
                  ),
                  SizedBox(height: 15),
                  //Action Buttons
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  LoginActionText(
//                    questionTitle: 'Belum punya akun?',
//                    actionTitle: 'Daftar',
//                    onTap: widget.signUpButtonTapped,
//                  ),
//                  LoginActionText(
//                    questionTitle: 'Lupa Password?',
//                    actionTitle: 'Reset',
//                    onTap: () {},
//                  ),
//                ],
//              ),
                ],
              ),
            ),
          ),
          Divider(
            height: 60,
            thickness: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Sudah Pernah Pesan?',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14),
                YellowOutlineButton(
                  onTap: () {},
                  title: 'Masuk Dengan Kode Order'.toUpperCase(),
                ),
                SizedBox(height: 14),
                Text(
                  'Belum punya akun?',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14),
                YellowOutlineButton(
                  onTap: () => Navigator.of(context).push(SignUpScreen.route(
                      () => Navigator.of(context).maybePop())),
                  title: 'Daftar Disini'.toUpperCase(),
                ),
              ],
            ),
          ),
        ],
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

      //Notify Auth service
      final auth = context.read<Auth>();
      final result = await auth.loginWithEmail(email, password);

      setState(() {
        isLoading = false;
        return _errorMessage = result;
      });
    }
    return null;
  }
}
