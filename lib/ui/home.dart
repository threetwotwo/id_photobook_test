import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/ui/screens/katalog_screen.dart';
import 'package:idphotobooktest/ui/screens/home_screen.dart';
import 'package:idphotobooktest/ui/screens/login_page.dart';
import 'package:idphotobooktest/ui/screens/login_signup_screen.dart';
import 'package:idphotobooktest/ui/screens/profile_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          LoginSignUpScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}