import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/feacture/home/domain/entities/pruebas/card_slide_profesional.dart';
import 'package:handiman_v0/feacture/home/presentation/views/worker_horizontal_listview.dart';
import 'package:handiman_v0/feacture/shared/custom_appbar/custon_appbar.dart';



class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() { super.initState(); }

  @override
  Widget build(BuildContext context) {
    //* el custon scrollview  trabaja con los slivers son de tipo personalizado
    return CustomScrollView(
      slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),        
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MovieHorizontalListView(
              slides: trabajadores,
              title: 'Daily Deals',
              icon: Icons.arrow_circle_right,
              loadNextPage: () {}
              ),
              
          ],
        );
      }, childCount: 1)),
    ]);
  }
}
