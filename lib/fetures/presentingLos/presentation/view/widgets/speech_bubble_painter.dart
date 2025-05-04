import 'package:flutter/material.dart';
class SpeechBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    const radius = 12.0;
    const tailWidth = 10.0;
    const tailHeight = 12.0;

    final path = Path();

    // Start drawing from top-left after tail
    path.moveTo(radius + tailWidth, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);
    path.lineTo(radius + tailWidth, size.height);
    path.quadraticBezierTo(
        tailWidth, size.height, tailWidth, size.height - radius);
    path.lineTo(tailWidth, size.height / 2 + tailHeight / 2);

    // Draw the tail
    path.lineTo(0, size.height / 2);
    path.lineTo(tailWidth, size.height / 2 - tailHeight / 2);

    path.lineTo(tailWidth, radius);
    path.quadraticBezierTo(tailWidth, 0, radius + tailWidth, 0);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}