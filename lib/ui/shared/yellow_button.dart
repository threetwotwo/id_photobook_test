import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/constants/styles.dart';

class YellowButton extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final VoidCallback onTap;
  final EdgeInsets padding;

  const YellowButton(
      {Key key,
      @required this.title,
      @required this.onTap,
      this.textStyle,
      this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: padding,
      color: AppColors.yellow,
      onPressed: onTap,
      child: Text(
        title,
        style: textStyle ?? Styles.h14Bold,
      ),
    );
  }
}
