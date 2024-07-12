
import 'package:handiman_v0/feacture/auth/domain/entities/users.dart';

abstract class AuthDatasources{
  Future<User> login(String email,String password);
  Future<User> register(String name, String email,String password);
  Future<User> checkAuthStatus(String token);
}