import 'package:handiman_v0/features/auth/domain/entities/users.dart';

class UserJsonMapper {
  static User userJsonToEntitie(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        name: json['fullName'],
        roles: List<String>.from(json['roles'].map((role) => role)),
        token: json['token'] ?? '',
      );
}
