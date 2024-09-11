import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/features/home/presentation/providers/slide_workers_state_providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(slideWorkersProvider).cardData.isEmpty;
  if( step1  ) return true;
  return false; //terminamos de cargar
});
