import 'package:flutter/material.dart';
import 'package:handiman_v0/feacture/shared/navigation/custom_button_navigation.dart';
import 'package:handiman_v0/feacture/home/presentation/views/home_view.dart';

class HomeScreen extends StatelessWidget {
 
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  HomeView(),
      bottomNavigationBar:  CustomBottonNavigation()
    );
  }
}
