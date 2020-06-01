import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/constants/styles.dart';
import 'package:idphotobooktest/models/user.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/services/repo.dart';
import 'package:idphotobooktest/ui/shared/avatar_image.dart';
import 'package:idphotobooktest/ui/shared/loading_indicator.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Auth>().user;

    return StreamBuilder<DocumentSnapshot>(
        stream: Repo.userStream(auth.uid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LoadingIndicator();

          final doc = snapshot.data;

          final user = User.fromDoc(doc);
//          if (!data.exists) Repo.createUserOnFirestore(auth);

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20),
                //Header
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200], width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 94,
                              width: 94,
                              child: Image.asset(
                                'assets/images/book 1.png',
                              ),
                            ),
                            SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  user.displayName,
                                  style: Styles.h18ExtraBold,
                                ),
                                Text(
                                  user.whatsAppNumber,
                                  style: Styles.h14Normal,
                                ),
                                Text(
                                  user.email,
                                  style: Styles.h14Normal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //Drop down button
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: AppColors.yellow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Daftar Transaksi',
                              style: Styles.h18ExtraBold,
                            ),
                            IconButton(
                              onPressed: () {
                                print('ProfileScreen.build');
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 28,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AvatarImage(
                    url: doc['photo_url'] ?? '',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
//                color: Colors.red,
                  child: Text(
                    doc.data.toString(),
                    textAlign: TextAlign.center,
                    style: Styles.baseStyle,
                  ),
                ),
                FlatButton(
                  onPressed: Auth.signOut,
                  child: Text(
                    'Sign out',
                    style: Styles.baseStyle,
                  ),
                )
              ],
            ),
          );
        });
  }
}
