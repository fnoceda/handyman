import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/features/home/domain/entities/pruebas/card_slide_category.dart';
import 'package:handiman_v0/features/home/domain/entities/pruebas/card_slide_profesional.dart';
import 'package:handiman_v0/features/home/presentation/providers/initial_loading.dart';
import 'package:handiman_v0/features/home/presentation/providers/slide_workers_state_providers.dart';
import 'package:handiman_v0/features/home/presentation/views/category_horizontal_listview.dart';
import 'package:handiman_v0/features/home/presentation/views/inscription_view.dart';
import 'package:handiman_v0/features/home/presentation/views/line_view.dart';
import 'package:handiman_v0/features/home/presentation/views/worker_horizontal_listview.dart';
import 'package:handiman_v0/features/shared/custom_appbar/custon_appbar.dart';
import 'package:handiman_v0/features/shared/widgets/full_screen_loader.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {

    ref.read(slideWorkersProvider.notifier).loadNextPage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //* consultamos los datos
    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading)  return const  FullScreenLoader();
    final workersSlidesData = ref.watch(slideWorkersProvider);




    //* el custon scrollview  trabaja con los slivers son de tipo personalizado
    return CustomScrollView(slivers: [
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
            //* workers
            WorkerHorizontalListView(
                slides: workersSlidesData.cardData,
                title: 'Daily Deals',
                icon: Icons.arrow_circle_right,
                loadNextPage: () {
                   ref.read(slideWorkersProvider.notifier).loadNextPage();
                }),
            //* categories
            CategoryHorizontalListView(
                slides: categories,
                title: 'Popular Categories',
                // icon: Icons.arrow_circle_right,
                subTitle: 'View all',
                loadNextPage: () {}),
            //*line
            const LineWidged(),
            //*inscription
            const InscriptionView(
              title: '10% OFF',
              description: 'Stay up to date with new products and exclusive offers. Your code will be displayed on the confirmation page and via email shortly after.',
              ),
          ],
        );
      }, childCount: 1)),
    ]);
  }
}
