import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/ui/shared/butterfly_loading.dart';
import 'package:idphotobooktest/ui/shared/diskon_badge.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RekomendasiPromo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Text(
            'REKOMENDASI PROMO',
            style: TextStyle(
                color: AppColors.orangePeel, fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder(
//          future: _mainRepository.getRekomendasiPromo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ButterflyLoading();
            }
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              return Container();
            }
            var data = snapshot.data.data;
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
//                          await Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) =>
//                                  PackageView(detail: data[index]),
//                            ),
//                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: data[index].images[0].png,
                              placeholder: (context, url) => ButterflyLoading(),
                              errorWidget: (context, url, error) => Center(
                                child:
                                    Image.asset('assets/images/no-image.jpg'),
                              ),
                            ),
                            Positioned(right: 20.0, child: DiskonBadge()),
                            Positioned(
                              top: 5.0,
                              right: 29.0,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                      ' ${((data[index].price - data[index].promoPrice) / data[index].price * 100).round()}%'),
                                  Text(
                                    'OFF',
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
//                                await Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                    builder: (context) => PackageView(
//                                      detail: data[index],
//                                    ),
//                                  ),
//                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  data[index].publishedName,
                                  style: TextStyle(
                                      color: AppColors.matterhorn,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  data[index].price == null ? '' : '199999',
                                  style: TextStyle(
                                      color: data[index].promoPrice == null
                                          ? AppColors.yellowGreen
                                          : AppColors.matterhorn,
                                      decoration: data[index].promoPrice == null
                                          ? TextDecoration.none
                                          : TextDecoration.lineThrough,
                                      fontWeight: FontWeight.bold),
                                ),
                                data[index].rating == null
                                    ? Container()
                                    : SmoothStarRating(
                                        allowHalfRating: false,
                                        rating: double.parse(
                                            data[index].rating.toString()),
                                        size: 20.0,
                                      )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  data[index].promoPrice == null
                                      ? ''
                                      : '150000',
//                                      : FlutterMoneyFormatter(
//                                          amount:
//                                              data[index].promoPrice.toDouble(),
//                                          settings: MoneyFormatterSettings(
//                                              symbol: 'Rp.',
//                                              fractionDigits: 0,
//                                              thousandSeparator: '.'),
//                                        ).output.symbolOnLeft,
                                  style: TextStyle(
                                      color: AppColors.yellowGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                data[index].sold == null
                                    ? Container()
                                    : Text(
                                        'Terjual ${data[index].sold} pcs tiap bulan')
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton.icon(
                              icon: SizedBox(
                                height: 25.0,
                                width: 25.0,
                                child: SvgPicture.asset(
                                  'assets/images/info.svg',
                                  color: Colors.grey,
                                ),
                              ),
                              label: Text(
                                'Detail',
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 14.0),
                              ),
                              onPressed: () async {
//                                await Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                    builder: (context) => PackageView(
//                                      detail: data[index],
//                                    ),
//                                  ),
//                                );
                              },
                            ),
                            FlatButton(
                              color: Colors.red,
                              child: Text(
                                'Pesan',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
//                                _customerBloc.addToCart(data[index]);
//                                pesanDialog(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
