import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';
import 'package:idphotobooktest/ui/shared/base_app_bar.dart';
import 'package:idphotobooktest/ui/widgets/katalog_choice_chip.dart';

class KatalogScreen extends StatefulWidget {
  @override
  _KatalogScreenState createState() => _KatalogScreenState();
}

class _KatalogScreenState extends State<KatalogScreen> {
  int selectedChip = 0;

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          //Collapsable appbar
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            elevation: 0,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                var top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  titlePadding:
                      EdgeInsetsDirectional.only(start: 16.0, bottom: 16.0),
                  centerTitle: false,
                  title: Opacity(
                    opacity: top < 100.0 ? 1.0 : 0.0,
                    child: Text('Katalog'),
                  ),
                  background: Image.asset('assets/images/katalog-photobook.jpg',
                      fit: BoxFit.cover),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Foto-foto Moms nanti dilayout jadi tema cantik kayak gini lho. Bakal dikasih cover istimewa juga. Ini nih pilihannya! Banyak banget dan bakal diupdate tiap bulan. Kalau Moms suka yang mana nih?',
                      style: TextStyle(color: AppColors.matterhorn),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: KatalogChoiceChip(
                                isSelected: selectedChip == 0,
                                onSelected: () => _select(0),
                                label: 'Semua Produk',
                              ),
                            ),
                            Expanded(
                              child: KatalogChoiceChip(
                                isSelected: selectedChip == 1,
                                onSelected: () => _select(1),
                                label: 'Semua Produk',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: KatalogChoiceChip(
                                isSelected: selectedChip == 2,
                                onSelected: () => _select(2),
                                label: 'Semua Produk',
                              ),
                            ),
                            Expanded(
                              child: KatalogChoiceChip(
                                isSelected: selectedChip == 3,
                                onSelected: () => _select(3),
                                label: 'Semua Produk',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 4999,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
//        body: Padding(
//          padding: const EdgeInsets.all(20.0),
//          child: Text(
//              'Foto-foto Moms nanti dilayout jadi tema cantik kayak gini lho. Bakal dikasih cover istimewa juga. Ini nih pilihannya! Banyak banget dan bakal diupdate tiap bulan. Kalau Moms suka yang mana nih?'),
//        ),
      ),
    );
  }

  void _select(int i) {
    setState(() {
      selectedChip = i;
    });
  }
}
