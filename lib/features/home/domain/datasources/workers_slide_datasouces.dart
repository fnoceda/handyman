import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';

abstract class SlideWorkerDatasources{
  Future<List<CardWorkerSlideData>> getAllWorkers(); 
  
  Future<CardWorkerSlideData> getWorkersById(String id); 
}
