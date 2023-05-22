import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:home_test/api/apiEndpoints/api_end_points.dart';
import 'package:home_test/di/injection.dart';
import 'package:home_test/interceptors/network_interceptor.dart';

@module
abstract class DioClientModule {
  @lazySingleton
  Dio get dioClient => Dio(
        BaseOptions(
          baseUrl: APIEndPoints.baseURL,
        ),
      )..interceptors.addAll(
          [getIt<NetworkInterceptor>(),]);

  @injectable
  Connectivity get connectivity => Connectivity();
}
