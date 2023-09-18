import 'package:apple_shop/core/params/auth_params.dart';
import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:dio/dio.dart';

abstract class IAuthDatasource {
  Future<List<String>> singUp(AuthParams params);
  Future<List<String>> logIn(AuthParams params);
}

class AuthDatasource extends IAuthDatasource {
  Dio dio;
  AuthDatasource(this.dio);

  // singUp
  @override
  Future<List<String>> singUp(AuthParams params) async {
    try {
      final response = await dio.post('collections/users/records', data: {
        'username': params.username,
        'password': params.password,
        'passwordConfirm': params.passwordConfirm,
      });

      if (response.statusCode == 200) {
        String userId = response.data['id'];
        String username = response.data['username'];
        return [userId, username];
      }
    } on DioError catch (ex) {
      throw ApiExeption(
        ex.response!.statusCode == 400
            ? 'کاربر از قبل وجود دارد'
            : 'اینترنت خود را چک کنید',
      );
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
    return ['خطای نا مشخص'];
  }

  // login
  @override
  Future<List<String>> logIn(AuthParams params) async {
    try {
      final response =
          await dio.post('collections/users/auth-with-password', data: {
        'identity': params.identity,
        'password': params.password,
      });
      if (response.statusCode == 200) {
        String userId = response.data['record']['id'];
        String token = response.data['token'];
        return [userId, token];
      }
    } on DioError catch (_) {
      throw ApiExeption('کاربری با این مشخصات وجود ندارد');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
    return ['خطای نا مشخص'];
  }
}
