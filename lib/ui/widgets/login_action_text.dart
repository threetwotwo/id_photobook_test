import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/styles.dart';

class LoginActionText extends StatelessWidget {
  final String questionTitle;
  final String actionTitle;
  final VoidCallback onTap;

  const LoginActionText(
      {Key key,
      @required this.questionTitle,
      @required this.actionTitle,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          questionTitle + ' ',
          style: Styles.b12Bold,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionTitle,
            style: Styles.b12Bold.copyWith(
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
