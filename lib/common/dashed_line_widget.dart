import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DashedLine({
    Key? key,
    this.height = 1.0,
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedLinePainter(
        height: height,
        color: color,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
      ),
      child: Container(),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  DashedLinePainter({
    required this.height,
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double startX = 0;

    while (startX < size.width) {
      canvas.drawRect(
        Rect.fromLTWH(startX, size.height / 2 - height / 2, dashWidth, height),
        paint,
      );
      startX += (dashWidth + dashSpace);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
