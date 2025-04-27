import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/errors/exception.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/database_services.dart';
import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub/core/utils/backend_enpoint.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/entites/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    {
      User? user;
      try {
        user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        var userEntity = UserEntity(uId: user.uid, name: name, email: email);

        await addUserData(user: userEntity);
        return right(userEntity);
      } on CustomException catch (e) {
        if (user != null) {
          await firebaseAuthService.deleteUser();
        }
        return left(
          ServerFailure(message: e.message),
        );
      } catch (e) {
        await deleteUser(user);
        log('exception on authrepoimpl.createUserWithEmailAndPassword: ${e.toString()}');
        return left(
          const ServerFailure(
              message: 'حصل خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.'),
        );
      }
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
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
      var userEntity = await getUserData(uid: user.uid);
      return right(
        userEntity,
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.ifDataExists(
          path: BackendEnpoint.isUserExist, documentId: user.uid);

      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(message: e.message),
      );
    } catch (e) {
      await deleteUser(user);
      log('exception on authrepoimpl.signInWithGoogle: ${e.toString()}');
      return left(
        const ServerFailure(
            message: 'حصل خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.ifDataExists(
        path: BackendEnpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(message: e.message),
      );
    } catch (e) {
      await deleteUser(user);
      log('exception on authrepoimpl.signInWithFacebook: ${e.toString()}');
      return left(
        const ServerFailure(
            message: 'حصل خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.ifDataExists(
        path: BackendEnpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(message: e.message),
      );
    } catch (e) {
      await deleteUser(user);
      log('exception on authrepoimpl.signInWithApple: ${e.toString()}');
      return left(
        const ServerFailure(
            message: 'حصل خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.'),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEnpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentid: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEnpoint.getUserData,
      documentId: uid,
    );

    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
