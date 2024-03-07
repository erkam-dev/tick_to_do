import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    String? id,
    String? email,
    String? name,
    String? photoUrl,
  }) = _Profile;
  factory Profile.fromModel(ProfileModel model) => Profile(
        id: model.id,
        email: model.email,
        name: model.name,
        photoUrl: model.photoUrl,
      );
}
