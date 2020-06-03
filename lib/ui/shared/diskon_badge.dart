import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';

class DiskonBadge extends StatelessWidget {
  final height;
  final width;
  final triangleHeight;

  DiskonBadge({this.height: 55.0, this.width: 50.0, this.triangleHeight: 12.0});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: height,
        width: width,
      ),
      painter: DiskonPainter(triangleHeight: triangleHeight),
    );
  }
}

class DiskonPainter extends CustomPainter {
  final triangleHeight;

  DiskonPainter({this.triangleHeight: 12.0});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width / 2, size.height - triangleHeight);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, 0.0);

    path.close();

    paint.color = AppColors.sunglow;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
