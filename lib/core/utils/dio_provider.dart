import 'package:apple_shop/core/utils/auth_manager.dart';
import 'package:dio/dio.dart';

abstract class DioProvider {
  static Dio requestWithToken() {
    final String token = AuthManager.readToken();
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'http://startflutter.ir/api/',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return dio;
  }

  static Dio requestWithOutToken() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'http://startflutter.ir/api/',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    return dio;
  }
}
