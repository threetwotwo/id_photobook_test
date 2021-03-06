import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:idphotobooktest/ui/home.dart';
import 'package:idphotobooktest/ui/shared/butterfly_loading.dart';
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
      home: MultiProvider(providers: [
        StreamProvider<Auth>(
          create: (BuildContext context) {
            return Auth.userStream();
          },
        )
//            ChangeNotifierProvider<Auth>(create: (BuildContext context) {
//              return Auth(widget.user);
//            }),
      ], child: Home()),
    );
  }
}
