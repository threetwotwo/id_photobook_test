import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';
import 'package:idphotobooktest/ui/shared/base_app_bar.dart';
import 'package:idphotobooktest/ui/widgets/home_orange_header.dart';
import 'package:idphotobooktest/ui/widgets/info_id_photobook_carousel.dart';
import 'package:idphotobooktest/ui/widgets/rekomendasi_promo.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bannerPageController = PageController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Auth>();

    return SafeScaffold(
      appBar: BaseAppBar(
        title: Container(
          height: 30,
          child: Row(
            children: <Widget>[
              Text(auth.user?.email ?? 'no user'),
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: <Widget>[
                  //Banner page view
                  PageView.builder(
                      controller: bannerPageController,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          color: Colors.grey[100],
                          child: Center(
                              child: Text('Banner' + (index + 1).toString())),
                        );
                      }),
                  //Page dot indicator
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmoothPageIndicator(
                        controller: bannerPageController,
                        count: 4,
                        effect: ScaleEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 12,
                          scale: 1.3,
                          dotColor: Colors.grey.withOpacity(0.5),
                          activeDotColor: AppColors.yellow,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Body content
            Column(
              children: <Widget>[
                InfoIDPhotobookCarousel(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(color: Colors.grey, height: 20),
                ),
                RekomendasiPromoListItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
