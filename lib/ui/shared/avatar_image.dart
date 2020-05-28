import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String url;
  final double radius;
  final VoidCallback onTap;
  final double padding;

  const AvatarImage(
      {Key key,
      @required this.url,
      this.radius = 124,
      this.onTap,
      this.padding = 4})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.all(padding ?? 4.0),
        child: Column(
          children: <Widget>[
            ClipOval(
              child: Container(
                color: Colors.grey[300],
                height: radius,
                width: radius,
                child: url.isEmpty
                    ? SizedBox()
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: url,
                        errorWidget: (_, __, ___) => SizedBox(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
