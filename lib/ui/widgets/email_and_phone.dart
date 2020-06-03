import 'package:flutter/material.dart';

class EmailAndPhone extends StatelessWidget {
  final String phone;
  final String email;
  EmailAndPhone({this.phone, this.email});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            phone,
            maxLines: 1,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            email,
            maxLines: 1,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
