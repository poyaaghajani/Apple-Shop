import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:dio/dio.dart';

abstract class IProductDatasource {
  Future<List<ProductModel>> getHotestProducts();
  Future<List<ProductModel>> getBestSellerProducts();
}

class ProductRemoteDatasource extends IProductDatasource {
  Dio dio;
  ProductRemoteDatasource(this.dio);

  @override
  Future<List<ProductModel>> getHotestProducts() async {
    try {
      Map<String, dynamic> query = {'filter': 'popularity="Hotest"'};

      var response = await dio.get(
        'collections/products/records',
        queryParameters: query,
      );
      return response.data['items']
          .map<ProductModel>((jsonObject) => ProductModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('لیست پربازدید ترین ها از دسترس خارج شده');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<List<ProductModel>> getBestSellerProducts() async {
    try {
      Map<String, dynamic> query = {'filter': 'popularity="Best Seller"'};

      var response = await dio.get(
        'collections/products/records',
        queryParameters: query,
      );
      return response.data['items']
          .map<ProductModel>((jsonObject) => ProductModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('لیست پرفروش ترین ها از دسترس خارج شده');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }
}
