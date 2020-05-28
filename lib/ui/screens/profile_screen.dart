import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/styles.dart';
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

          final data = snapshot.data;

          if (!data.exists) Repo.createUserOnFirestore(auth);

          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AvatarImage(
                  url: '',
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
//                color: Colors.red,
                child: Text(
                  data.data.toString(),
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
          );
        });
  }
}
