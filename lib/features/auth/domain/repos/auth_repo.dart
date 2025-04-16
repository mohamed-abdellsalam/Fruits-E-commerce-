import 'package:fruits_hub/features/auth/entites/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> createUserWithEmailAndPassword({
    String email,
    String password,
  });
}
