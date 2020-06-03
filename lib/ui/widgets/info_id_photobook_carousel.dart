import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/ui/widgets/home_orange_header.dart';

import 'info_card.dart';

class InfoIDPhotobookCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        OrangeHeaderHome(title: 'INFO IDPHOTOBOOK'),
        Container(
          height: 137.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 16),
              InfoCard(
                image: 'assets/images/cara-pemesanan.jpg',
                text: 'Cara Pemesanan',
              ),
              SizedBox(width: 16),
              InfoCard(
                image: 'assets/images/kirimfoto.jpg',
                text: 'Kirim Foto',
              ),
              SizedBox(width: 16),
              InfoCard(
                image: 'assets/images/proses-produksi.jpg',
                text: 'Proses Produksi',
              ),
              SizedBox(width: 16),
              InfoCard(
                image: 'assets/images/katalog.jpg',
                text: 'Pricelist',
              ),
              SizedBox(width: 16),
              InfoCard(
                image: 'assets/images/cover-desain.jpg',
                text: 'Cover & Desain',
              ),
              SizedBox(width: 16),
              InfoCard(
                image: 'assets/images/ukuran.jpg',
                text: 'Variant Ukuran',
              ),
              SizedBox(width: 16),
              InfoCard(
                image: 'assets/images/trusted.jpg',
                text: '100% TRUSTED',
              ),
              SizedBox(width: 16),
            ],
          ),
        )
      ],
    );
  }
}
