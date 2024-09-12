import 'package:flutter/material.dart';
import 'package:handiman_v0/features/shared/pricigns/pricing_card.dart';

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
                child: PricingCard(
                  slideData: data,
                ))));
  }
}

MapSlideData data = MapSlideData(
    planName: 'Enterprise',
    price: 49.50,
    listData: [
      MessageOption(text: 'Unlimited Clients'),
      MessageOption(
          text: 'Receive Messages from Your Clients' ),
      MessageOption(text: 'Unlimited Fields'),
      MessageOption(text: 'Promoting'),
      MessageOption(text: 'See All Your Clients Reviews'),
      MessageOption(text: 'Tool Rentals' ),
    ]);
