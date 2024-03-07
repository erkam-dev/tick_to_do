import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    String? id,
    String? email,
    String? name,
    String? photoUrl,
  }) = _ProfileModel;

  factory ProfileModel.fromFirebase(User user) {
    return ProfileModel(
      id: user.uid,
      email: user.email,
      name: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
