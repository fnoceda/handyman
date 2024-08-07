import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/features/auth/domain/entities/users.dart';
import 'package:handiman_v0/features/auth/domain/repositories/auth_repository.dart';
import 'package:handiman_v0/features/auth/infrastructure/errors/auth_errors.dart';
import 'package:handiman_v0/features/auth/infrastructure/repository/auth_repository_impl.dart';
import 'package:handiman_v0/features/shared/services/key_value_storage_services.dart';
import 'package:handiman_v0/features/shared/services/key_value_storage_services_impl.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  //podemos pasarle un datasources o directamente que use por defecto uno
  // final authRepositoryImpl= AuthRepositoryImpl(datasource: AuthDatasourcesImpl());
  final authRepositoryImpl = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageImpl();
  //a partir de aqui guardamos en la memoria
  return AuthNotifier(
      authRepository: authRepositoryImpl,
      keyValueStorageService: keyValueStorageService);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final KeyValueStrorageService keyValueStorageService;

  AuthNotifier(
      {required this.authRepository, required this.keyValueStorageService})
      : super(AuthState()) {
    checkAuthStatus();
  }
  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on WorngCredentials {
      logout('Credenciales no son correctas');
    } on ConectionTimeout catch (e) {
      logout(e.message);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no Controlado');
    }
  }

  Future<void> registerUser(String email, String password) async {}
  Future<void> checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');
    if (token == null) {
      return logout();
    }
    try {
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(user);
    } catch (e) {
      logout();
    }
  }

  void _setLoggedUser(User user) async {
    await keyValueStorageService.setKeyValue('token', user.token);
    state = state.copyWhith(
        user: user, authState: AuthStatus.authenticated, errorMessage: '');
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    state = state.copyWhith(
        authState: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }
}

enum AuthStatus { cheking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authState;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authState = AuthStatus.cheking, this.user, this.errorMessage = ''});

  AuthState copyWhith({
    User? user,
    AuthStatus? authState,
    String? errorMessage,
  }) =>
      AuthState(
          authState: authState ?? this.authState,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}
