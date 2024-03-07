import 'package:dartz/dartz.dart';
import 'package:tick_to_do/app/auth/domain/repositories/auth_repository.dart';

import '../../../../core/core.dart';

class SignInWithGoogleUseCase
    implements Usecase<Either<Failure, Unit>, NoParams> {
  final AuthRepository authRepository;

  SignInWithGoogleUseCase(this.authRepository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async =>
      await authRepository.signInWithGoogle();
}
