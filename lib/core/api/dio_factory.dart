import 'package:dio/dio.dart';

class DioFactory {
  static Dio newInstance() {
    final dio = Dio();

    dio.options.baseUrl = 'https://run.mocky.io/v3/';

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

    return dio;
  }
}
