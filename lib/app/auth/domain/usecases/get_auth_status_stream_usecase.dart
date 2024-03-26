import 'package:firebase_auth/firebase_auth.dart';
import 'package:tick_to_do/app/auth/domain/repositories/auth_repository.dart';

import '../../../../core/core.dart';

class GetAuthStatusStreamUsecase
    implements UsecaseNoFuture<Stream<User?>, NoParams> {
  final AuthRepository repository;

  GetAuthStatusStreamUsecase(this.repository);

  @override
  Stream<User?> call(NoParams noParams) => repository.getAuthStatusStream();
}
