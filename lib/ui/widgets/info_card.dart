import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;

  InfoCard({this.image, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                style: TextStyle(color: Colors.grey[800], fontSize: 12),
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
