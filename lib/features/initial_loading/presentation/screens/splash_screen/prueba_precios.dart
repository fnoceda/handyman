import 'package:flutter/material.dart';
import 'package:handiman_v0/features/shared/pricigns/pricigns_card.dart';
import 'package:handiman_v0/features/shared/pricigns/pricing_card_chatgpt.dart';

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
        child: PricingCardChatGPT(
          features: const [
              'Unlimited Clients',
              'Receive Messages from Your Clients',
              'Unlimited Fields',
              'Promoting',
              'See All Your Clients Reviews',
              'Tool Rentals',
            ],
        )))
      );
  }
}
