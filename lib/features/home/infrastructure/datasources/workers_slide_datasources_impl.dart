import 'package:dio/dio.dart';
import 'package:handiman_v0/core/config/environment/environment.dart';
import 'package:handiman_v0/features/home/domain/datasources/workers_slide_datasouces.dart';
import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';
import 'package:handiman_v0/features/home/infrastructure/mappers/workers_slides_mappers.dart';

class WorkersSlideDatasourcesImpl extends SlideWorkerDatasources {
  late final Dio dio;
  WorkersSlideDatasourcesImpl()
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
        ));
  @override
  Future<List<CardWorkerSlideData>> getAllWorkers() async {
    try {
      final response = await dio.get('/workers');
      final List<CardWorkerSlideData> slides = [];
      for (final slide in response.data['dat'] ?? []) {
        slides.add(WorkersSlideMapper.jsonToEntity(slide));
      }
      return slides;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<CardWorkerSlideData> getWorkersById(String id) {
    // TODO: implement getAllWorkersById
    throw UnimplementedError();
  }
}
