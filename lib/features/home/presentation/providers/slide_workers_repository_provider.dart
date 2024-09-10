

  //provider de solo lectura para manejar la implementacion del provider principal

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/features/home/domain/repositories/workers_slide_repositories.dart';
import 'package:handiman_v0/features/home/infrastructure/datasources/workers_slide_datasources_impl.dart';
import 'package:handiman_v0/features/home/infrastructure/repositories/workers_slide_repositories_impl.dart';

final slideWorkersRepositoryProvider = Provider<SlideWorkerRepositories>((ref) {
  
  final slideRepository= WorkersSlideRepositoriesImpl(
      datasources: WorkersSlideDatasourcesImpl()
    );
  
  return slideRepository;
});