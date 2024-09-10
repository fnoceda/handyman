import 'package:flutter/material.dart';
import 'package:handiman_v0/features/shared/logotype/handy_man_logotype.dart';
import 'package:handiman_v0/features/shared/pricigns/pricigns_card.dart';

class PruebaPrecios extends StatelessWidget {
  const PruebaPrecios({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
      child: SizedBox(
        width: size.width * 0.850,
        height: size.height * 0.8,
        child: PricingCard()))
      );
  }
}
