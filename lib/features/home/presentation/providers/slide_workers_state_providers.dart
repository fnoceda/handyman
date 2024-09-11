import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';
import 'package:handiman_v0/features/home/domain/repositories/workers_slide_repositories.dart';
import 'package:handiman_v0/features/home/presentation/providers/slide_workers_repository_provider.dart';

//*control slide workers
final slideWorkersProvider =
    StateNotifierProvider<SlideWorkersNotifier, SlideState>((ref) {
  final slideWorkersProvider = ref.watch(slideWorkersRepositoryProvider);
  return SlideWorkersNotifier(slideWorkersProvider: slideWorkersProvider);
});

//*type def
typedef WorkerCallback = Future<List<CardWorkerSlideData>> Function(
    {int limit, int offset});

//* notifier
class SlideWorkersNotifier extends StateNotifier<SlideState> {
  SlideWorkerRepositories slideWorkersProvider;

  SlideWorkersNotifier({required this.slideWorkersProvider})
      : super(SlideState()){
        loadNextPage();
      }

  Future<void> loadNextPage() async {
    if (state.isLoading || state.isLastPage) return;
    state = state.copyWith(isLoading: true);
    final List<CardWorkerSlideData> workers = await slideWorkersProvider
        .getAllWorkers(limit: state.limit, offset: state.offset);
    if (workers.isEmpty) {
      state = state.copyWith(isLoading: false, isLastPage: true);
      return;
    }
    state = state.copyWith(
        isLastPage: false,
        isLoading: false,
        offset: state.offset + 10,
        cardData: [...state.cardData, ...workers]);
  }
}

//*state
class SlideState {
  final List<CardWorkerSlideData> cardData;
  final bool isLastPage;
  final int limit;
  final int offset;
  final bool isLoading;

  SlideState({
    this.cardData = const [],
    this.isLoading = false,
    this.isLastPage = false,
    this.limit = 10,
    this.offset = 0,
  });

  SlideState copyWith({
    List<CardWorkerSlideData>? cardData,
    bool? isLoading,
    bool? isLastPage,
    int? limit,
    int? offset,
  }) =>
      SlideState(
        isLastPage: isLastPage ?? this.isLastPage,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        cardData: cardData ?? this.cardData,
        isLoading: isLoading ?? this.isLoading,
      );
}
