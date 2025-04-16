import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/erros/failures.dart';
import 'package:fruits_hub/features/auth/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}
