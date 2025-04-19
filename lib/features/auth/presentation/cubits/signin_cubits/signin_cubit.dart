import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/entites/user_entity.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    var result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(SigninFailure(failure.message));
      },
      (userEntity) {
        emit(SigninSuccess(userEntity: userEntity));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) {
        emit(SigninFailure(failure.message));
      },
      (userEntity) {
        emit(SigninSuccess(userEntity: userEntity));
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) {
        emit(SigninFailure(failure.message));
      },
      (userEntity) {
        emit(SigninSuccess(userEntity: userEntity));
      },
    );
  }
}
