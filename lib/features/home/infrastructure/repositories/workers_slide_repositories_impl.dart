import 'package:handiman_v0/features/home/domain/datasources/workers_slide_datasouces.dart';
import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';
import 'package:handiman_v0/features/home/domain/repositories/workers_slide_repositories.dart';

class WorkersSlideRepositoriesImpl extends SlideWorkerRepositories {
  final SlideWorkerDatasources datasources;
  WorkersSlideRepositoriesImpl({required this.datasources});
  @override
  Future<List<CardWorkerSlideData>> getAllWorkers({int limit = 10 ,int offset = 0}) {
      return datasources.getAllWorkers(limit: limit,offset: offset);
  }

  @override
  Future<List<CardWorkerSlideData>> getWorkersById(String id) {
    // TODO: implement getWorkersById
    throw UnimplementedError();
  }

}