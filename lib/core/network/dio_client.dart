import 'package:dio/dio.dart';

import '../config/env.dart';

class DioClient {
  const DioClient._();

  static Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: Env.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }
}
