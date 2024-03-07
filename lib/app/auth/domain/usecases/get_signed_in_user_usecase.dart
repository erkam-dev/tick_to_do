import 'package:tick_to_do/app/app.dart';

import '../../../../core/core.dart';

class GetSignedInUserUseCase
    implements UsecaseNoFuture<ProfileModel?, NoParams> {
  final AuthRepository authRepository;

  GetSignedInUserUseCase(this.authRepository);

  @override
  ProfileModel? call(NoParams params) => authRepository.getSignedInUser();
}
