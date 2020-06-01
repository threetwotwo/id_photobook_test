import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';
import 'package:idphotobooktest/ui/shared/base_app_bar.dart';
import 'package:idphotobooktest/ui/shared/yellow_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      appBar: BaseAppBar(),
      child: ListView(
        children: <Widget>[
          //Header with CTA
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 375,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              image: DecorationImage(
                image: AssetImage('assets/images/hero1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
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
                  child: YellowButton(
                    onTap: () {},
                    title: 'Buat Photobookmu Sekarang!',
                  ),
                ),
              ],
            ),
          ),
          //Categories
          SizedBox(height: 30),
          Text(
            'Pilih foto dan cetak sesuai keinginan',
            style: Styles.h18ExtraBold,
            textAlign: TextAlign.center,
          ),
          Text(
            'Dari photobook, photocard, hingga photo lamp bisa kamu buat disini!',
            style: Styles.b12Normal,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: List.generate(
                6,
                (index) => Column(
                  children: <Widget>[
                    Container(
                      color: Colors.grey[100],
                      child: Image.asset(
                        'assets/images/img_photobook 1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'PHOTOBOOK',
                      style: Styles.h13ExtraBold,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
