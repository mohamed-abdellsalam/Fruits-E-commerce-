import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exception.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/entites/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    {
      try {
        var user = await firebaseAuthService.createUserWithEmailAndPassword(
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
        log('exception on authrepoimpl.createUserWithEmailAndPassword: ${e.toString()}');
        return left(
          const ServerFailure(
              message: 'حصل خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
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
      log('exception on authrepoimpl.signInWithEmailAndPassword: ${e.toString()}');
      return left(
        const ServerFailure(
            message: 'حصل خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(
        ServerFailure(message: e.message),
      );
    } catch (e) {
      log('exception on authrepoimpl.signInWithGoogle: ${e.toString()}');
      return left(
        const ServerFailure(
            message: 'حصل خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(
        ServerFailure(message: e.message),
      );
    } catch (e) {
      log('exception on authrepoimpl.signInWithFacebook: ${e.toString()}');
      return left(
        const ServerFailure(
            message: 'حصل خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.'),
      );
    }
  }
}
