import 'package:tick_to_do/app/auth/domain/repositories/auth_repository.dart';

import '../../../../core/core.dart';

class DeleteAccountUseCase implements Usecase<void, NoParams> {
  final AuthRepository authRepository;

  DeleteAccountUseCase(this.authRepository);

  @override
  Future<void> call(NoParams params) async =>
      await authRepository.deleteAccount();
}
