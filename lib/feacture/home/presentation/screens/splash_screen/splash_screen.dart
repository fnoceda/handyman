import 'package:flutter/material.dart';
import 'package:handiman_v0/features/shared/logotype/handy_man_logotype.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(17, 17, 17, 1),
      child: const Column(children: [
        Padding(
            padding: EdgeInsets.only(top: 352, left: 91),
            child: HandymanLogotype()),
        Center(
            child: CircularProgressIndicator(
          strokeWidth: 2,
        )),
      ]),
    );
  }
}
