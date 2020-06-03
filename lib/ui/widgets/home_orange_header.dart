import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';

class OrangeHeaderHome extends StatelessWidget {
  final String title;

  const OrangeHeaderHome({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style:
            TextStyle(color: AppColors.orangePeel, fontWeight: FontWeight.bold),
      ),
    );
  }
}
