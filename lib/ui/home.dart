import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/ui/screens/katalog_screen.dart';
import 'package:idphotobooktest/ui/screens/home_screen.dart';
import 'package:idphotobooktest/ui/screens/login_page.dart';
import 'package:idphotobooktest/ui/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;

  const Home({Key key, @required this.user}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(create: (BuildContext context) {
          return Auth(widget.user);
        }),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.yellow,
          unselectedItemColor: Colors.grey,
          currentIndex: _tabIndex,
          onTap: (val) {
            setState(() {
              _tabIndex = val;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: SizedBox(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: SizedBox(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: SizedBox(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: SizedBox(),
            ),
          ],
        ),
        body: IndexedStack(
          index: _tabIndex,
          children: <Widget>[
            HomeScreen(),
            KatalogScreen(),
            Container(),
            widget.user == null ? LoginPage() : AkunView(),
          ],
        ),
      ),
    );
  }
}
