import 'package:handiman_v0/feacture/auth/domain/datasources/auth_datasources.dart';
import 'package:handiman_v0/feacture/auth/domain/entities/users.dart';
import 'package:handiman_v0/feacture/auth/domain/repositories/auth_repository.dart';
import 'package:handiman_v0/feacture/auth/infrastructure/datasources/auth_datasources_impl.dart';

class AuthRepositoryImpl extends AuthRepository{

  final AuthDatasources datasource;

  AuthRepositoryImpl({
      AuthDatasources? datasource
      }) : datasource = datasource ?? AuthDatasourcesImpl();


  @override
  Future<User> checkAuthStatus(String token) async {
    return await datasource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) async {
    return await datasource.login(email, password);
  }

  @override
  Future<User> register(String name, String email, String password) async {
    return await datasource.register(name, email, password);
  }

}