import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  path: '.env',
  useConstantCase: true,
  requireEnvFile: true,
  obfuscate: true,
)
abstract class Env {
  @EnviedField()
  static String baseUrl = _Env.baseUrl;
}
