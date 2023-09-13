import 'package:apple_shop/core/params/comment_params.dart';
import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/feat_comment/data/models/comment_model.dart';
import 'package:dio/dio.dart';

abstract class ICommentDatasource {
  Future<CommentModel> getAllComments(String productId, int page);
  Future<void> addComment(CommentParams params);
}

class CommentRemoteDatasource extends ICommentDatasource {
  final Dio dio;
  CommentRemoteDatasource(this.dio);

  // get all comments
  @override
  Future<CommentModel> getAllComments(String productId, int page) async {
    try {
      Map<String, dynamic> query = {
        'filter': 'product_id="$productId"',
        'page': page,
        'expand': 'user_id',
      };
      var response = await dio.get(
        'collections/comment/records',
        queryParameters: query,
      );
      return CommentModel.fromJson(response.data);
    } on DioError catch (_) {
      throw ApiExeption('لیست کامنت از دسترس خارج شده');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }

  // add new comment
  @override
  Future<void> addComment(CommentParams params) async {
    try {
      await dio.post(
        'collections/comment/records',
        data: {
          'text': params.text,
          'user_id': params.userId,
          'product_id': params.productId,
        },
      );
    } on DioError catch (_) {
      throw ApiExeption('مشکلی در افزودن کامنت پیش آمده');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }
}
