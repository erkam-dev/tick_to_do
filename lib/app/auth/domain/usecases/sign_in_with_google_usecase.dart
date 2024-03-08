import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tick_to_do/app/auth/domain/repositories/auth_repository.dart';

import '../../../../core/core.dart';

class SignInWithGoogleUseCase
    implements Usecase<Either<Failure, UserCredential?>, NoParams> {
  final AuthRepository authRepository;

  SignInWithGoogleUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserCredential?>> call(NoParams params) async =>
      await authRepository.signInWithGoogle();
}
