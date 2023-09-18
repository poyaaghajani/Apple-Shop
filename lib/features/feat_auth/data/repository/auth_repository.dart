import 'package:apple_shop/core/params/auth_params.dart';
import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/core/utils/auth_manager.dart';
import 'package:apple_shop/features/feat_auth/data/datasource/auth_datasource.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<String, List<String>>> singUp(AuthParams params);
  Future<Either<String, List<String>>> logIn(AuthParams params);
}

class AuthRepository extends IAuthRepository {
  IAuthDatasource authDatasource;
  AuthRepository(this.authDatasource);

  // singup
  @override
  Future<Either<String, List<String>>> singUp(AuthParams params) async {
    try {
      final user = await authDatasource.singUp(params);
      if (user.isNotEmpty) {
        AuthManager.saveUserId(user[0]);
        AuthManager.saveUsername(user[1]);

        return right(['به اپل شاپ خوش آمدید']);
      }
    } on ApiExeption catch (ex) {
      return left(ex.message!);
    }
    return left('خطای نامشخص');
  }

  // login
  @override
  Future<Either<String, List<String>>> logIn(AuthParams params) async {
    try {
      final user = await authDatasource.logIn(params);
      if (user.isNotEmpty) {
        AuthManager.saveUserId(user[0]);
        AuthManager.saveToken(user[1]);

        return right(['به اپل شاپ خوش آمدید']);
      }
    } on ApiExeption catch (ex) {
      return left(ex.message!);
    }
    return left('خطای نامشخص');
  }
}
