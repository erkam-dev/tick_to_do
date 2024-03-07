import 'package:dartz/dartz.dart';

import '../../../../lib.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signInWithGoogle();

  ProfileModel getSignedInUser();

  Future<void> signOut();
}
