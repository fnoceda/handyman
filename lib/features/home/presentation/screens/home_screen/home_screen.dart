import 'package:flutter/material.dart';
import 'package:handiman_v0/features/shared/navigation/custom_button_navigation.dart';
import 'package:handiman_v0/features/home/presentation/views/home_view.dart';

class HomeScreen extends StatelessWidget {
 
  const HomeScreen({super.key});

//*tod implementar
//final goRouterNotifier = ref.watch(slideWorkersProvider.notifier).loadProduct();



  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  HomeView(),
      bottomNavigationBar:  CustomBottonNavigation()
    );
  }
}
