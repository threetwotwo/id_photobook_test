import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomerPhoto extends StatelessWidget {
  final String photo;
  CustomerPhoto({this.photo});
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        height: 150.0,
        width: 150.0,
        child: photo == null
            ? Image.asset(
                'assets/images/profile-picture.jpg',
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: photo,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/profile-picture.jpg',
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
