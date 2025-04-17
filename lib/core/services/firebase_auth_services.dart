import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exception.dart';

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
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الكلمة السر ضعيفة للغاية.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد تم استخدام هذا البريد الإلكتروني بالفعل.');
      }
    } catch (e) {
      throw CustomException(
          message: 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.');
    }
    throw CustomException(
        message: 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا.');
  }
}
