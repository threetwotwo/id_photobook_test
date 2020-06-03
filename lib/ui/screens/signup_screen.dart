import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';
import 'package:idphotobooktest/ui/shared/base_app_bar.dart';
import 'package:idphotobooktest/ui/shared/base_text_form_field.dart';
import 'package:idphotobooktest/ui/shared/yellow_button.dart';
import 'package:idphotobooktest/ui/shared/yellow_outline_button.dart';
import 'package:idphotobooktest/ui/widgets/legacy_text_form_field.dart';
import 'package:idphotobooktest/ui/widgets/login_action_text.dart';
import 'package:idphotobooktest/utils/validators.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onLoginButtonTapped;

  const SignUpScreen({Key key, this.onLoginButtonTapped}) : super(key: key);

  static MaterialPageRoute route(VoidCallback onLoginButtonTapped) =>
      MaterialPageRoute(
          builder: (_) => SignUpScreen(
                onLoginButtonTapped: onLoginButtonTapped,
              ));

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final whatsAppNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  ///Shows any error message during login
  String _errorMessage;

  bool isLoading = false;

  bool isObscuringPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      appBar: BaseAppBar(title: Text('Daftar')),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(16),
                        height: 196,
                        width: 196,
                        child: Image.asset(
                          'assets/images/book.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Yuuk Daftar ke IDPhotobook.com',
                    style: Styles.h18ExtraBold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  LegacyTextFormField(
                    controller: nameController,
                    validator: (val) => Validators.validateName(val),
                    label: 'Nama Lengkap',
                    hint: 'masukan nama lengkap kakak',
                  ),
                  SizedBox(height: 18),
                  LegacyTextFormField(
                    controller: whatsAppNumberController,
                    validator: (val) => Validators.validateWhatsApp(val),
                    label: 'Nomor Whatsapp',
                    hint: 'masukan no whatsapp kakak',
                  ),
                  LegacyTextFormField(
                    controller: emailController,
                    validator: (val) => Validators.validateEmail(val),
                    label: 'Email',
                    hint: 'masukan email kakak jika ada',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '*kosonging jika tidak punya',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  LegacyTextFormField(
                    controller: passwordController,
                    validator: (val) => Validators.validatePass(val),
                    label: 'Password',
                    shouldShowSuffix: true,
                    obscureText: isObscuringPassword,
                    onSuffixTapped: () {
                      setState(() {
                        isObscuringPassword = !isObscuringPassword;
                      });
                    },
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () => Navigator.of(context).maybePop(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            'Sudah punya akun?',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ),
                    ],
                  ),
                  YellowButton(
                    onTap: _signUp,
                    isLoading: isLoading,
                    title: 'Daftar Sekarang',
                    textStyle: TextStyle(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
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
                  'Sudah punya akun?',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14),
                YellowOutlineButton(
                  onTap: () => Navigator.of(context).maybePop(),
                  title: 'Login Disini'.toUpperCase(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    final isValidated = _formKey.currentState.validate();

    if (isValidated) {
      setState(() {
        isLoading = true;
      });
      final result = await Auth.createUser(
        displayName: nameController.text.trim(),
        whatsAppNumber: whatsAppNumberController.text,
        phoneNumber: phoneNumberController.text,
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      setState(() {
        isLoading = false;
        return _errorMessage = result;
      });
    }
  }
}
