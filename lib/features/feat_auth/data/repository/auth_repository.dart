import 'package:apple_shop/core/params/auth_params.dart';
import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/core/utils/auth_manager.dart';
import 'package:apple_shop/features/feat_auth/data/datasource/auth_datasource.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> singUp(AuthParams params);
  Future<Either<String, String>> logIn(AuthParams params);
}

class AuthRepository extends IAuthRepository {
  IAuthDatasource authDatasource;
  AuthRepository(this.authDatasource);

  // singup
  @override
  Future<Either<String, String>> singUp(AuthParams params) async {
    try {
      final username = await authDatasource.singUp(params);
      if (username.isNotEmpty) {
        AuthManager.saveUsername(username);
        return right('خوش آمدید');
      }
    } on ApiExeption catch (ex) {
      return left(ex.message!);
    }
    return left('خطای نامشخص');
  }

  // login
  @override
  Future<Either<String, String>> logIn(AuthParams params) async {
    try {
      final token = await authDatasource.logIn(params);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('خوش آمدید');
      }
    } on ApiExeption catch (ex) {
      return left(ex.message!);
    }
    return left('خطای نامشخص');
  }
}
