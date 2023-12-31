import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_category/data/datasource/category_datasource.dart';
import 'package:apple_shop/features/feat_category/data/models/category_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<CategoryModel>>> getCategories();
  Future<Either<String, List<ProductModel>>> getOneCategory(String catId);
  Future<Either<String, CategoryModel>> getProductCategory(String catId);
}

class CategoryRepository extends ICategoryRepository {
  ICategoryDatasource datasource;
  CategoryRepository(this.datasource);

  @override
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      var categories = await datasource.getCategories();
      return right(categories);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getOneCategory(
      String catId) async {
    try {
      var categories = await datasource.getOneCategory(catId);
      return right(categories);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<Either<String, CategoryModel>> getProductCategory(String catId) async {
    try {
      var productCategory = await datasource.getProductCategory(catId);
      return right(productCategory);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }
}
