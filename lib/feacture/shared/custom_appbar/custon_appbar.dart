import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:cinemapedia/domain/entities/movie.dart';
// import 'package:cinemapedia/presentation/providers/providers.dart';
// import 'package:cinemapedia/presentation/delegates/search_delegate_movie.dart';
// import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef  ref) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.1,
            ),
            const Image(
              image: AssetImage('assets/images/logotype_inline.png'),
            ),
            const SizedBox(
              width: 5,
            ),
            const Spacer(),
            IconButton(onPressed: ()  {}, icon: const Icon(Icons.shopping_cart),color: Colors.white,)
          ],
        ),
      ),
    ));
  }
}
