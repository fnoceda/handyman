import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';

abstract class SlideWorkerRepositories{
  Future<List<CardWorkerSlideData>> getAllWorkers({int limit = 10 ,int offset = 0}); 
  Future<List<CardWorkerSlideData>> getWorkersById(String id); 

}
