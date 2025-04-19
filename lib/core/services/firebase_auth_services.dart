import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الكلمة السر ضعيفة للغاية.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد تم استخدام هذا البريد الإلكتروني بالفعل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من اتصالك بالإنترنت.');
      }
    } catch (e) {
      log('exception on FirebaseAuthServices.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(
          message: 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.');
    }
    throw CustomException(
        message: 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.');
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException(
            message:
                'هذا البريد الإلكتروني غير موجود أو كلمة المرور غير صحيحة.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'كلمة المرور غير صحيحة أو البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من اتصالك بالإنترنت.');
      }
    } catch (e) {
      log('exception on FirebaseAuthServices.signInWithEmailAndPassword: ${e.toString()}');
      throw CustomException(
          message: 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.');
    }
    throw CustomException(
        message: 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.');
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }
}
