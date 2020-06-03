import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';

class EditProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: AppColors.orangePeel, width: 2.0),
        ),
        child: Text(
          'EDIT PROFIL',
          style: TextStyle(color: AppColors.orangePeel),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Container()));
        },
      ),
    );
  }
}
