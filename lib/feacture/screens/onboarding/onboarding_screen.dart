import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:handiman_v0/feacture/screens/onboarding/onboarding_data.dart';

//*provider de indice de onvoarding un solo uso
final slideIndexProvider = StateProvider<double>((ref) => 0.0);
//*

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final slides = slidesInfo;
  final PageController pageViewController = PageController();
  bool endReached = false;
  double pageLoc = 0;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final double page = pageViewController.page ?? 0;
      ref.read(slideIndexProvider.notifier).update((state) => page);
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children:
                slides.map((slideData) => _Slide(slide: slideData)).toList(),
          ),
          //*skip
          endReached ? const SizedBox() : const _SkipButton(),
          //*button
          endReached ? const _GetStartedButton() : const _ButtonContinue(),
          const _Dots()
        ],
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 22,
        bottom: 25,
        child: FadeInRight(
          child: TextButton(
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.grey),
            ),
            onPressed: () => context.pop(),
          ),
        ));
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 130,
        bottom: 20,
        child: FadeInRight(
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFFFEBC11),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: 160,
            height: 64,
            child: FilledButton.tonal(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xFFFEBC11))),
              child: const Center(
                child: Row(children: [
                  Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              onPressed: () => context.pop(),
            ),
          ),
        ));
  }
}

class _ButtonContinue extends StatelessWidget {
  const _ButtonContinue();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 220,
        bottom: 20,
        child: FadeInRight(
          from: 15,
          delay: const Duration(seconds: 1),
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFFFEBC11),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: 170,
            height: 64,
            child: FilledButton.tonal(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xFFFEBC11))),
              child: const Row(children: [
                Text(
                  'Continue',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 9),
                Icon(Icons.arrow_forward_outlined)
              ]),
              onPressed: () => context.pop(),
            ),
          ),
        ));
  }
}

class _Dots extends ConsumerWidget {
  const _Dots();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexSlide = ref.watch(slideIndexProvider);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.740),
      child: SizedBox(
        width: double.infinity,
        height: 210,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...slidesInfo.map((e) {
              return _Dot(
                color: (indexSlide >= (e.index - 0.2) &&
                        indexSlide < (e.index + 0.2))
                    ? const Color(0xFFFEBC11)
                    : Colors.grey,
              );
            })
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;

  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      duration: const Duration(milliseconds: 200),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slide;

  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(slide.imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Text(
                slide.title ?? '',
                style: const TextStyle(
                    fontFamily: 'sf font',
                    fontSize: 21,
                    decoration: TextDecoration.none,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                slide.caption ?? '',
                style: const TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.none,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (slide.tags != null) GridviewText(tags: slide.tags!,crossAxisCount: slide.crossAxisCount!,)
          ],
        ),
      ),
    );
  }

}

class GridviewText extends StatelessWidget {
  final Map<String, Icon> tags;
  final int  crossAxisCount;
  const GridviewText({super.key, required this.tags, required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.950,
      height: 200,
      child: GridView.count(
        childAspectRatio: 72.0,
        crossAxisCount: crossAxisCount,
        children: [
          for (var entry in tags.entries)
            Row(
              children: [
                entry.value,
                Text(
                  entry.key,
                  style: const TextStyle(
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      color: Colors.white),
                )
              ],
            )
        ],
      ),
    );
  }
}
