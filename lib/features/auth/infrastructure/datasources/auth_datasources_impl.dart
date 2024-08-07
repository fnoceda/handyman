import 'package:dio/dio.dart';
import 'package:handiman_v0/core/config/environment/environment.dart';
import 'package:handiman_v0/features/auth/domain/entities/users.dart';
import 'package:handiman_v0/features/auth/infrastructure/errors/auth_errors.dart';
import 'package:handiman_v0/features/auth/infrastructure/mappers/user_mapper.dart';
import '../../domain/datasources/auth_datasources.dart';

class AuthDatasourcesImpl extends AuthDatasources {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
    connectTimeout: const Duration(milliseconds: 10000),
    receiveTimeout: const Duration(milliseconds: 10000),
  ));

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/auth/check-status',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final user = UserJsonMapper.userJsonToEntitie(response.data);
      return user;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConectionTimeout(message: 'Tiempo de conexion agotado');
      }
      if (e.response?.statusCode == 401) {
        throw CustomError(message: "Token Incorrecto");
      }
      throw CustomError(message: "Error");
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio
          .post('/auth/login', data: {'email': email, 'password': password});

      final user = UserJsonMapper.userJsonToEntitie(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
            message: e.response?.data['message'] ?? 'Credenciales Invalidas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConectionTimeout(message: 'Tiempo de conexion expirado');
      }
      throw CustomError(message: "something wrong happend");
    } catch (e) {
      throw CustomError(message: "Error");
    }
  }

  @override
  Future<User> register(String name, String email, String password) async {
    throw UnimplementedError();
  }
}
