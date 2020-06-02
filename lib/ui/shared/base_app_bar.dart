import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const BaseAppBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.yellow,
      title: title,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
