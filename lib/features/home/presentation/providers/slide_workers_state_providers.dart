import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';
import 'package:handiman_v0/features/home/domain/repositories/workers_slide_repositories.dart';
import 'package:handiman_v0/features/home/presentation/providers/slide_workers_repository_provider.dart';


final slideWorkersProvider = StateNotifierProvider<SlideWorkersNotifier, SlideWorkingState>((ref) {

  final slideWorkersInfo= ref.watch(slideWorkersRepositoryProvider);

  return SlideWorkersNotifier(slideWorkersRepositories: slideWorkersInfo);
});




class SlideWorkersNotifier extends StateNotifier<SlideWorkingState> {
  final SlideWorkerRepositories slideWorkersRepositories;

  SlideWorkersNotifier({
    required this.slideWorkersRepositories,
    }): super(SlideWorkingState()){
      loadProduct();
    }

    Future<void> loadProduct() async {
        try {
          final slide = await slideWorkersRepositories.getAllWorkers();
          state = state.copywith(
            isLoading: false,
            working: slide
          );
        } catch (e) {
          print(e);
        }
    }


}


class SlideWorkingState{
  // final String? id;
  final List<CardWorkerSlideData>? working;
  final bool isLoading;

  SlideWorkingState( {
    // this.id,
    this.working,
    this.isLoading =true,
   });

   SlideWorkingState copywith({
      String? id,
      List<CardWorkerSlideData>? working,
      bool? isLoading,

   })=>SlideWorkingState(
    working: working ?? this.working,
    isLoading: isLoading ?? this.isLoading,
    );

}