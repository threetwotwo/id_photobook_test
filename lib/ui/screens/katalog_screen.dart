import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';
import 'package:idphotobooktest/ui/shared/base_app_bar.dart';
import 'package:idphotobooktest/ui/widgets/katalog_choice_chip.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
            child: Column(
              children: <Widget>[
                //Moms Text
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Foto-foto Moms nanti dilayout jadi tema cantik kayak gini lho. Bakal dikasih cover istimewa juga. Ini nih pilihannya! Banyak banget dan bakal diupdate tiap bulan. Kalau Moms suka yang mana nih?',
                    style: TextStyle(color: AppColors.matterhorn),
                  ),
                ),
                //Sort buttons
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
                StaggeredGridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  physics: NeverScrollableScrollPhysics(),
                  staggeredTiles: [
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                    StaggeredTile.fit(1),
                  ],
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                color: Colors.amber,
                                child: Image.asset(
                                  'assets/images/upload.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'New Bella SeriesNew Bella SeriesNew Bella SeriesNew Bella Series',
                                  style: TextStyle(
                                    color: AppColors.matterhorn,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Rp.150.000',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Text(
                                  'Rp.100.000',
                                  style: TextStyle(
                                    color: AppColors.yellowGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SmoothStarRating(
                                  starCount: 5,
                                  rating: 5,
                                  size: 16,
                                ),
                                Text(
                                  'Terjual 9 pcs',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 240,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 260,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 210,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 240,
                      color: Colors.amber,
                    ),
                  ],
                ),
//                Container(
//                  height: 4999,
//                  color: Colors.grey,
//                )
              ],
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
