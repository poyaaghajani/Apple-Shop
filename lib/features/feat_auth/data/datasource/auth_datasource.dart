import 'package:apple_shop/core/params/auth_params.dart';
import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:dio/dio.dart';

abstract class IAuthDatasource {
  Future<String> singUp(AuthParams params);
  Future<String> logIn(AuthParams params);
}

class AuthDatasource extends IAuthDatasource {
  Dio dio;
  AuthDatasource(this.dio);

  // singUp
  @override
  Future<String> singUp(AuthParams params) async {
    try {
      final response = await dio.post('collections/users/records', data: {
        'username': params.username,
        'password': params.password,
        'passwordConfirm': params.passwordConfirm,
      });

      if (response.statusCode == 200) {
        return response.data['username'];
      }
    } on DioError catch (_) {
      throw ApiExeption('اینترنت خود را چک کنید');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
    return 'خطای نا مشخص';
  }

  // login
  @override
  Future<String> logIn(AuthParams params) async {
    try {
      final response =
          await dio.post('collections/users/auth-with-password', data: {
        'identity': params.identity,
        'password': params.password,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      }
    } on DioError catch (_) {
      throw ApiExeption('کاربری با این مشخصات وجود ندارد');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
    return 'خطای نا مشخص';
  }
}
