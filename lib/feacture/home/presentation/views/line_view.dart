import 'package:flutter/material.dart';

class LineWidged extends StatelessWidget {
  const LineWidged({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPaint(
      size: Size((size.width * 0.950),5),
      painter: _LinearPainter(),
    );
  }
}

class _LinearPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //propiedades
    lapiz.color= const Color(0xff424242);
    lapiz.style = PaintingStyle.fill; // stroke.
    lapiz.strokeWidth =2;

    final path =  Path();
    //dibujar con el lapiz
    path.moveTo(0, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.33);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.4);
    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
   
  }

}
