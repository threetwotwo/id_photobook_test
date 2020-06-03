import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';

import 'info_card.dart';

class InfoIDPhotobookCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'INFO IDPHOTOBOOK',
          style: TextStyle(
              color: AppColors.orangePeel, fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        Container(
          height: 137.0,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              InfoCard(
                image: 'assets/images/cara-pemesanan.jpg',
                text: 'Cara Pemesanan',
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              InfoCard(
                image: 'assets/images/kirimfoto.jpg',
                text: 'Kirim Foto',
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              InfoCard(
                image: 'assets/images/proses-produksi.jpg',
                text: 'Proses Produksi',
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              InkWell(
                borderRadius: BorderRadius.circular(8.0),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/katalog.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Pricelist',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              InfoCard(
                image: 'assets/images/cover-desain.jpg',
                text: 'Cover & Desain',
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              InfoCard(
                image: 'assets/images/ukuran.jpg',
                text: 'Variant Ukuran',
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              InfoCard(
                image: 'assets/images/trusted.jpg',
                text: '100% TRUSTED',
              ),
            ],
          ),
        )
      ],
    );
  }
}
