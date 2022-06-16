import 'dart:ui';

import 'package:flutter/material.dart';

class HeaderLoginWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      child: CustomPaint(
        painter: _CrearHeaderPainter(),
      ),
    );
  }
}

class _CrearHeaderPainter extends CustomPainter {

    @override
    void paint(Canvas canvas, Size size) {
      final paint = new Paint();
      paint.color = Color.fromRGBO(0, 68, 129, 1.0);
      paint.style = PaintingStyle.fill;

      final path = new Path();
      path.lineTo(0, size.height * 1.0);
      path.lineTo(size.width * 0.2, size.height * 0.8);
      path.lineTo(size.width, size.height * 1.0);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, paint);
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) => true;
  }

  class HeaderRegistroWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      child: CustomPaint(
        painter: _CrearHeaderRegistroPainter(),
      ),
    );
  }
}

class _CrearHeaderRegistroPainter extends CustomPainter {
   @override
    void paint(Canvas canvas, Size size) {
      final paint = new Paint();
      paint.color = Color.fromRGBO(0, 68, 129, 1.0);
      paint.style = PaintingStyle.fill;

      final path = new Path();
      path.lineTo(0, size.height * 1.0);
      path.lineTo(size.width * 0.2, size.height * 0.8);
      path.lineTo(size.width, size.height * 1.0);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, paint);
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) => true;
}