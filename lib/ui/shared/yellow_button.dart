import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/ui/shared/loading_indicator.dart';

class YellowButton extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final bool isLoading;

  const YellowButton(
      {Key key,
      @required this.title,
      @required this.onTap,
      this.textStyle,
      this.padding,
      this.isLoading = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: padding,
      color: AppColors.yellow,
      onPressed: onTap,
      child: isLoading
          ? LoadingIndicator(padding: const EdgeInsets.all(0))
          : Text(
              title,
              style: textStyle ?? Styles.h14Bold,
            ),
    );
  }
}
