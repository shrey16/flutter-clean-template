import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../app/router/app_router.dart';
import '../network/dio_client.dart';

@module
abstract class AppModule {
  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @lazySingleton
  Dio get dio => DioClient.create();
}
