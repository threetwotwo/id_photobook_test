import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/constants/styles.dart';

class YellowOutlineButton extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final VoidCallback onTap;
  final EdgeInsets padding;

  const YellowOutlineButton({
    Key key,
    @required this.title,
    this.textStyle,
    @required this.onTap,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(color: AppColors.yellow, width: 2),
      padding: padding,
      onPressed: onTap,
      child: Text(
        title,
        style: textStyle ?? Styles.h14Bold,
      ),
    );
  }
}
