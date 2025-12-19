import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  const Env._();

  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';
}
