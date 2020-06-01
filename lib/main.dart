import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/ui/home.dart';
import 'package:idphotobooktest/ui/login_screen.dart';
import 'package:idphotobooktest/ui/screens/login_page.dart';
import 'package:idphotobooktest/ui/screens/login_signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: AppColors.yellow,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder<FirebaseUser>(
          stream: Auth.userStream(),
          builder: (context, snapshot) {
            final data = snapshot.data;

            return MultiProvider(providers: [
              ChangeNotifierProvider<Auth>(
                create: (BuildContext context) => Auth(data),
              )
            ], child: data == null ? LoginSignUpScreen() : Home());
          }),
    );
  }
}
