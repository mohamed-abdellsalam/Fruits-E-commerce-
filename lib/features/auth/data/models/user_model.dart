import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uId, required super.name, required super.email});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}
