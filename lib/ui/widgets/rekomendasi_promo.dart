import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/ui/shared/diskon_badge.dart';
import 'package:idphotobooktest/ui/widgets/home_orange_header.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RekomendasiPromoListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        OrangeHeaderHome(title: 'REKOMENDASI PROMO'),
        Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.grey[200],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DiskonBadge(),
              ),
            ),
          ],
        ),
        Container(
//          color: Colors.amber,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Gold Series 100',
                style: TextStyle(
                  color: AppColors.matterhorn,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Rp.150.000',
                    style: TextStyle(
                      color: AppColors.matterhorn,
                      fontSize: 16,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SmoothStarRating(
                    starCount: 5,
                    rating: 4,
                    size: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Rp.250.000',
                    style: TextStyle(
                      color: AppColors.yellowGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Terjual 97 pcs tiap bulan',
                    style: TextStyle(color: Colors.grey),
                  ),
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
                  style: TextStyle(color: Colors.grey[700], fontSize: 14.0),
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
    );
  }
}
