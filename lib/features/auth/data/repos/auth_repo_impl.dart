import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/erros/exception.dart';
import 'package:fruits_hub/core/erros/failures.dart';
import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/entites/user_entity.dart';

final firebaseAuthServices = FirebaseAuthServices();

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    {
      try {
        var user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return right(
          UserModel.fromFirebaseUser(user),
        );
      } on CustomException catch (e) {
        return left(
          ServerFailure(message: e.message),
        );
      } catch (e) {
        return left(
          const ServerFailure(
              message: 'An unknown error occurred. please try again later.'),
        );
      }
    }
  }
}
