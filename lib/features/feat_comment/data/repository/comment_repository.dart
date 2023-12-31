import 'package:apple_shop/core/params/comment_params.dart';
import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/feat_comment/data/datasource/comment_datasource.dart';
import 'package:apple_shop/features/feat_comment/data/models/comment_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICommentRepository {
  Future<Either<String, CommentModel>> getAllComments(
      String productId, int page);
  Future<Either<String, String>> addComment(CommentParams params);
}

class CommentRepository extends ICommentRepository {
  final ICommentDatasource datasource;
  CommentRepository(this.datasource);

  // get all comments
  @override
  Future<Either<String, CommentModel>> getAllComments(
      String productId, int page) async {
    try {
      var comment = await datasource.getAllComments(productId, page);
      return right(comment);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  // add new comment
  @override
  Future<Either<String, String>> addComment(CommentParams params) async {
    try {
      await datasource.addComment(params);
      return right('کامنت شما با موفقیت اضافه شد');
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }
}
