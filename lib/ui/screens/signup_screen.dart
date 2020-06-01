import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';
import 'package:idphotobooktest/ui/shared/base_text_form_field.dart';
import 'package:idphotobooktest/ui/shared/yellow_button.dart';
import 'package:idphotobooktest/ui/widgets/login_action_text.dart';
import 'package:idphotobooktest/utils/validators.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onLoginButtonTapped;

  const SignUpScreen({Key key, this.onLoginButtonTapped}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                'Daftar IDPhotobook',
                style: Styles.h18ExtraBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              BaseTextFormField(
                controller: nameController,
                validator: (val) => Validators.validateName(val),
                title: 'Nama Lengkap',
              ),
              SizedBox(height: 18),
              BaseTextFormField(
                controller: whatsAppNumberController,
                validator: (val) => Validators.validateWhatsApp(val),
                title: 'Nomor Whatsapp',
              ),
              SizedBox(height: 18),
              BaseTextFormField(
                controller: phoneNumberController,
                validator: (val) => Validators.validatePhone(val),
                title: 'Nomor Handphone',
                subtitle: '( Kosongkan jika no. HP dan no. Whatsapp sama )',
              ),
              SizedBox(height: 18),
              BaseTextFormField(
                controller: emailController,
                validator: (val) => Validators.validateEmail(val),
                title: 'Email',
              ),
              SizedBox(height: 18),
              BaseTextFormField(
                controller: passwordController,
                validator: (val) => Validators.validatePass(val),
                title: 'Password',
              ),
              SizedBox(height: 20),
              YellowButton(
                onTap: _signUp,
                isLoading: isLoading,
                title: 'Daftar Sekarang',
              ),
              SizedBox(height: 20),
              LoginActionText(
                questionTitle: 'Sudah Punya Akun?',
                actionTitle: 'Masuk',
                onTap: widget.onLoginButtonTapped,
              ),
            ],
          ),
        ),
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
