import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_category/data/models/category_model.dart';
import 'package:dio/dio.dart';

abstract class ICategoryDatasource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getOneCategory(String catId);
}

class CategoryRemoteDatasource extends ICategoryDatasource {
  Dio dio;
  CategoryRemoteDatasource(this.dio);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await dio.get('collections/category/records');
      return response.data['items']
          .map<CategoryModel>(
              (jsonObject) => CategoryModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('لیست دسته بندی از دسترس خارج شده');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<List<ProductModel>> getOneCategory(String catId) async {
    try {
      Map<String, dynamic> query = {'filter': 'category="$catId"'};
      var response = await dio.get(
        'collections/products/records',
        queryParameters: catId == '78q8w901e6iipuk' ? {} : query,
      );
      return response.data['items']
          .map<ProductModel>((jsonObject) => ProductModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('لیست دسته بندی از دسترس خارج شده');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }
}
