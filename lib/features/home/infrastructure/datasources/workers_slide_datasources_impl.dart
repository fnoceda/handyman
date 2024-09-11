import 'package:dio/dio.dart';
import 'package:handiman_v0/core/config/environment/environment.dart';
import 'package:handiman_v0/features/auth/infrastructure/errors/auth_errors.dart';
import 'package:handiman_v0/features/home/domain/datasources/workers_slide_datasouces.dart';
import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';
import 'package:handiman_v0/features/home/infrastructure/mappers/workers_slides_mappers.dart';

class WorkersSlideDatasourcesImpl extends SlideWorkerDatasources {
  late final Dio dio;
  WorkersSlideDatasourcesImpl()
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
          connectTimeout: const Duration(milliseconds: 10000),
          receiveTimeout: const Duration(milliseconds: 10000),
        ));
  @override
  Future<List<CardWorkerSlideData>> getAllWorkers({int limit = 10 ,int offset = 0}) async {
    try {
      final response =
          await dio.get('/workers', queryParameters: {'limit': limit,'offset' : offset});
      final List<CardWorkerSlideData> slides = [];
      for (final slide in response.data['dat'] ?? []) {
        slides.add(WorkersSlideMapper.jsonToEntity(slide));
      }
      return slides;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConectionTimeout(message: 'Tiempo de conexion agotado');
      }
      if (e.response?.statusCode == 401) {
        throw CustomError(message: "Token Incorrecto");
      }
      throw CustomError(message: "Error");
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
