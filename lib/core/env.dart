import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GOOGLE_SIGN_IN_SERVER_CLIENT_ID')
  static const String googleSignInServerClientId =
      _Env.googleSignInServerClientId;
}
