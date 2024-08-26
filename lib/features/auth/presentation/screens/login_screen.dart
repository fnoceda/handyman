import 'package:flutter/material.dart';
import 'package:handiman_v0/features/shared/widgets/icon_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: GeometricalBackground(
              child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 350),
            // Icon Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  height:
                      size.height - 350, // 80 los dos sizebox y 100 el ícono
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF959595)
                        .withOpacity(0.3)
                        .withAlpha(40),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: const ButtonsLogin()
                  // const _LoginForm(),
                  ),
            )
          ],
        ),
      ))),
    );
  }
}

class ButtonsLogin extends StatelessWidget {
  const ButtonsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
             Image(
              image: AssetImage('assets/images/logotype_inline.png'),
            ),
          ],
        ),
    );
  }
}




