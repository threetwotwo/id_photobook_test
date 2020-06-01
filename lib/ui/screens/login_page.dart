import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';
import 'package:idphotobooktest/ui/shared/base_text_form_field.dart';
import 'package:idphotobooktest/ui/shared/yellow_button.dart';
import 'package:idphotobooktest/ui/shared/yellow_outline_button.dart';
import 'package:idphotobooktest/ui/widgets/login_action_text.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback signUpButtonTapped;
  final VoidCallback passwordResetButtonTapped;

  const LoginPage(
      {Key key, this.signUpButtonTapped, this.passwordResetButtonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 35),
            Container(
              height: 135,
              width: 135,
              child: Image.asset('assets/images/book 1.png'),
            ),
            SizedBox(height: 28),
            Text(
              'Yuk Login ke IDPhotobook!',
              style: Styles.h18ExtraBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 28),
            BaseTextFormField(
              title: 'Email Atau No Whatsapp',
              hint: 'Masukan email atau no whatsapp',
            ),
            SizedBox(height: 18),
            BaseTextFormField(
              title: 'Password',
              hint: 'Masukan password',
            ),
            SizedBox(height: 40),
            YellowButton(
              onTap: () {},
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
                  onTap: signUpButtonTapped,
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
    );
  }
}
