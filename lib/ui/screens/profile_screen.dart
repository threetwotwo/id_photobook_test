import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/ui/screens/login_page.dart';
import 'package:idphotobooktest/ui/widgets/button_kupon.dart';
import 'package:idphotobooktest/ui/widgets/customer_photo.dart';
import 'package:idphotobooktest/ui/widgets/edit_profile_button.dart';
import 'package:idphotobooktest/ui/widgets/email_and_phone.dart';
import 'package:idphotobooktest/ui/widgets/logout_button.dart';
import 'package:idphotobooktest/ui/widgets/member_card.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    if (auth.user == null) return LoginPage();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: SizedBox(
          height: 30.0,
          child: Image.asset('assets/images/logo.png', fit: BoxFit.fitHeight),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[200],
              child: Column(
                children: <Widget>[
                  Text(
                    'IDPhotobook Club Member',
                    style: TextStyle(
                        color: AppColors.matterhorn,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  MemberCard(name: auth.user.displayName, type: 1),
                  Text(
                    'Tap untuk melihat detil',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CustomerPhoto(photo: auth.user?.photoUrl),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0)),
                            Text(
                              auth.user?.displayName ?? '',
                              maxLines: 1,
                              style: TextStyle(
                                  color: AppColors.matterhorn,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            EmailAndPhone(
                                email: auth.user?.email ?? 'email',
                                phone: auth.user?.phoneNumber ?? 'phone'),
                            EditProfileButton(),
                            LogoutButton()
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Button(
                        color: AppColors.goldenTainoi,
                        text: 'Daftar Transaksi',
                        textStyle: TextStyle(color: Colors.black),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child:
                              Icon(Icons.shopping_basket, color: Colors.white),
                        ),
                        height: 60.0,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        onPressed: () {},
                      ),
                      ButtonKupon()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//class ProfileScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final auth = context.watch<Auth>();
//
//    if (auth.user == null) return SizedBox();
//
//    return StreamBuilder<DocumentSnapshot>(
//        stream: Repo.userStream(auth.user.uid),
//        builder: (context, snapshot) {
//          if (!snapshot.hasData) return LoadingIndicator();
//
//          final doc = snapshot.data;
//
//          final user = User.fromDoc(doc);
////          if (!data.exists) Repo.createUserOnFirestore(auth);
//
//          return Padding(
//            padding: const EdgeInsets.all(20.0),
//            child: ListView(
//              children: <Widget>[
//                SizedBox(height: 20),
//                //Header
//                Container(
//                  decoration: BoxDecoration(
//                      border: Border.all(color: Colors.grey[200], width: 2)),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.all(15),
//                        child: Row(
//                          children: <Widget>[
//                            Container(
//                              height: 94,
//                              width: 94,
//                              child: Image.asset(
//                                'assets/images/book 1.png',
//                              ),
//                            ),
//                            SizedBox(width: 14),
//                            Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Text(
//                                  user.displayName,
//                                  style: Styles.h18ExtraBold,
//                                ),
//                                Text(
//                                  user.whatsAppNumber,
//                                  style: Styles.h14Normal,
//                                ),
//                                Text(
//                                  user.email,
//                                  style: Styles.h14Normal,
//                                ),
//                              ],
//                            ),
//                          ],
//                        ),
//                      ),
//                      //Drop down button
//                      Container(
//                        padding: const EdgeInsets.all(10),
//                        color: AppColors.yellow,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Text(
//                              'Daftar Transaksi',
//                              style: Styles.h18ExtraBold,
//                            ),
//                            IconButton(
//                              onPressed: () {
//                                print('ProfileScreen.build');
//                              },
//                              icon: Icon(
//                                Icons.arrow_drop_down,
//                                size: 28,
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: AvatarImage(
//                    url: doc['photo_url'] ?? '',
//                  ),
//                ),
//                Container(
//                  padding: const EdgeInsets.all(16),
////                color: Colors.red,
//                  child: Text(
//                    doc.data.toString(),
//                    textAlign: TextAlign.center,
//                    style: Styles.baseStyle,
//                  ),
//                ),
//                FlatButton(
//                  onPressed: () {
//                    auth.signOut();
//                  },
//                  child: Text(
//                    'Sign out',
//                    style: Styles.baseStyle,
//                  ),
//                )
//              ],
//            ),
//          );
//        });
//  }
//}
