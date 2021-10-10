import 'package:flutter/material.dart';

class PainterScreenMovie extends StatelessWidget {
  
  const PainterScreenMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      height: 50,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      // color: Colors.red,
      child: CustomPaint(
        painter: _ScreenCinemaPainter(),
      ),
    );
  }
}


class _ScreenCinemaPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo( size.width * 0.5 , 0 , size.width, size.height);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;


}