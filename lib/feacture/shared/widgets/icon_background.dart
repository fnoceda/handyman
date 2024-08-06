import 'package:flutter/material.dart';
import 'dart:ui';



class GeometricalBackground extends StatelessWidget {
  final Widget child;
  const GeometricalBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(child: Container(color: backgroundColor)),
          const BackgroundIcons(),
          child,
        ],
      ),
    );
  }
}

class BackgroundIcons extends StatelessWidget {
  const BackgroundIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Stack(
      children: [
        //cuarta fila
        PositionedIcon(radius: 80, top: (420-60), left: (220 + 25), angle: 0.5, icon: Icons.home),
        FilterDesenfocado(),
        //primeros tres horizontal
        PositionedIcon(radius: 00, top: (090-20), left: 260, angle: 0.5, icon: Icons.plumbing),
        PositionedIcon(radius: 00, top: (090-20), left: 120, angle: 0.5, icon: Icons.construction),
        PositionedIcon(radius: 00, top: (080-20), left: 400, angle: 0.5, icon: Icons.construction),
        //segunda fila
        PositionedIcon(radius: 80, top: (190-35), left: (205 + 10), angle: 0.4, icon: Icons.electrical_services),
        PositionedIcon(radius: 80, top: (190-35), left: (070 + 10), angle: 0.4, icon: Icons.home),
        PositionedIcon(radius: 80, top: (200-35), left: (340 + 10), angle: 1.5, icon: Icons.build),
        //tercera fila
        PositionedIcon(radius: 00, top: (290-45), left: (150 + 20), angle: 0.5, icon: Icons.home),
        PositionedIcon(radius: 00, top: (310-45), left: (280 + 20), angle: 0.5, icon: Icons.construction),
      ],
    );
  }
}


class FilterDesenfocado extends StatelessWidget {
  const FilterDesenfocado({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (420-60), 
      left: (220 + 25),
      child: BackdropFilter(
              filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child:  const SizedBox(
              width: 80,
              height: 80,
            ),
            ),
    );
  }
}

class PositionedIcon extends StatelessWidget {
  final IconData icon;
  final double top;
  final double left;
  final double angle;
  final double radius;

  const PositionedIcon({
      super.key,
      required this.icon,
      required this.top,
      required this.left,
      required this.angle, 
      required this.radius
      });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: angle,
        child:
        Opacity(
          opacity: 0.3,
          child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:
                Icon(
                  icon,
                  size: 50,
                  color: Colors.black,
                ),
              ),
            ),
        ),
      ),
    );
  }
}




