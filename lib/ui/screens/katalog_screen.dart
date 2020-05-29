import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/ui/safe_scaffold.dart';
import 'package:idphotobooktest/ui/shared/base_app_bar.dart';

class KatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      appBar: BaseAppBar(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            //Header
            Text(
              'PHOTOBOOK THEME',
              style: Styles.h18ExtraBold,
            ),
            Text(
              'Pilih tema dari ratusan tema dari desainer terbaik kami',
              style: Styles.h14Normal,
            ),
            //Divider and sort button
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //Sort button
                Row(
                  children: <Widget>[
                    Text('Sort', style: Styles.h14Normal),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                //Show button
                Row(
                  children: <Widget>[
                    Text('Show', style: Styles.h14Normal),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ],
            ),
            Divider(
              height: 16,
              thickness: 1,
              color: Colors.grey,
            ),
            //Katalog
            SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.82,
              children: List.generate(
                8,
                (index) => InkWell(
                  onTap: () {},
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            'assets/images/Dear Mom_thumb_300x300.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'DEAR MOM',
                            style: Styles.h14ExtraBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
