import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 375,
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ABADIKAN MOMEN INDAHMU',
                  style: Styles.h18ExtraBold,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Cetak Photobook. Gratis Ongkir Keseluruh Indonesia',
                  style: Styles.h14Normal,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    color: AppColors.yellow,
                    onPressed: () {},
                    child: Text('Buat Photobookmu Sekarang!'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
