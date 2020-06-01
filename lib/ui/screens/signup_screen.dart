import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/ui/shared/base_text_form_field.dart';
import 'package:idphotobooktest/ui/shared/yellow_button.dart';
import 'package:idphotobooktest/ui/widgets/login_action_text.dart';

class SignUpScreen extends StatelessWidget {
  final VoidCallback onLoginButtonTapped;

  const SignUpScreen({Key key, this.onLoginButtonTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
            title: 'Nama Lengkap',
          ),
          SizedBox(height: 18),
          BaseTextFormField(
            title: 'Nomor Whatsapp',
          ),
          SizedBox(height: 18),
          BaseTextFormField(
            title: 'Nomor Handphone',
            subtitle: '( Kosongkan jika no. HP dan no. Whatsapp sama )',
          ),
          SizedBox(height: 18),
          BaseTextFormField(
            title: 'Email',
          ),
          SizedBox(height: 18),
          BaseTextFormField(
            title: 'Password',
          ),
          SizedBox(height: 20),
          YellowButton(
            onTap: () {},
            title: 'Daftar Sekarang',
          ),
          SizedBox(height: 20),
          LoginActionText(
            questionTitle: 'Sudah Punya Akun?',
            actionTitle: 'Masuk',
            onTap: onLoginButtonTapped,
          ),
        ],
      ),
    );
  }
}
