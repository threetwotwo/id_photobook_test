import 'package:flutter/material.dart';
import 'package:idphotobooktest/services/auth.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Auth>();

    return SizedBox(
      width: 150.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.grey[600], width: 2.0),
        ),
        child: Text(
          'KELUAR',
          style: TextStyle(color: Colors.grey[600]),
        ),
        onPressed: () => auth.signOut(),
      ),
    );
  }
}
