import 'package:flutter/material.dart';

class BottomNavShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  BottomNavShadowPainter({
    required this.shadow,
    required this.clipper,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);

    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return true;
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0150000);
    path0.lineTo(size.width * 0.3675000, size.height * 0.0150000);
    path0.lineTo(size.width, size.height * 0.0080000);
    path0.lineTo(size.width * 0.9937500, size.height * 0.9800000);
    path0.lineTo(size.width * 0.0037500, size.height * 0.9650000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
