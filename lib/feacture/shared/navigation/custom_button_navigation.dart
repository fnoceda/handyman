import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';



//*icon list 

List<IconData> iconList = [
  Icons.home_max,
  Icons.search,
  Icons.favorite_border,
  Icons.account_circle,
];




class CustomBottonNavigation extends StatefulWidget {

  const CustomBottonNavigation({ super.key });

  @override
  State<CustomBottonNavigation> createState() => _CustomBottonNavigationState();
}

class _CustomBottonNavigationState extends State<CustomBottonNavigation> with TickerProviderStateMixin {


  final autoSizeGroup = AutoSizeGroup();
  var  _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;


  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive
              ? Colors.purple
              : Colors.black;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 30,
                color: color,
              ),
              const SizedBox(height: 4),
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        splashColor: Colors.blueAccent,
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 200,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.none,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        hideAnimationController: _hideBottomBarAnimationController,
        elevation: 0,
      );
  }
}
