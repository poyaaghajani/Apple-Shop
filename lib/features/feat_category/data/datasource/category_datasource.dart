import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/feat_category/data/models/category_model.dart';
import 'package:dio/dio.dart';

abstract class ICategoryDatasource {
  Future<List<CategoryModel>> getCategories();
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
              (jsomObject) => CategoryModel.fromJson(jsomObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('لیست دسته بندی از دسترس خارج شده');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }
}
