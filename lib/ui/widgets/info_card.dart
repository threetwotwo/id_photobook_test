import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;

  InfoCard({this.image, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
