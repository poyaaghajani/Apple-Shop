import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/feat-product/data/models/product_gallery.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat-product/data/models/product_variant.dart';
import 'package:apple_shop/features/feat-product/data/models/property_model.dart';
import 'package:apple_shop/features/feat-product/data/models/variant.dart';
import 'package:apple_shop/features/feat-product/data/models/variant_type.dart';
import 'package:dio/dio.dart';

abstract class IProductDatasource {
  Future<List<ProductModel>> getHotestProducts();
  Future<List<ProductModel>> getBestSellerProducts();
  Future<List<ProductGallery>> getProductGallery(String productId);
  Future<List<ProductModel>> getProductPopularity(String popularity);
  Future<List<Variant>> getVariants(String productId);
  Future<List<VariantType>> getVariantTypes();
  Future<List<ProductVariant>> getProductVariants(String productId);
  Future<List<PropertyModel>> getProperties(String productId);
  // Future<int> getProductFinalPrice(ProductModel product);
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

  @override
  Future<List<ProductGallery>> getProductGallery(String productId) async {
    try {
      Map<String, dynamic> query = {'filter': 'product_id="$productId"'};

      var response = await dio.get(
        'collections/gallery/records',
        queryParameters: query,
      );
      return response.data['items']
          .map<ProductGallery>(
              (jsonObject) => ProductGallery.fromJson(jsonObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('عکسی برای نمایش وجود ندارد');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<List<ProductModel>> getProductPopularity(String popularity) async {
    try {
      Map<String, dynamic> query = {'filter': 'popularity="$popularity"'};

      var response = await dio.get(
        'collections/products/records',
        queryParameters: query,
      );
      return response.data['items']
          .map<ProductModel>((jsonObject) => ProductModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('لیست محصولات از دسترس خارج شده');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<List<Variant>> getVariants(String productId) async {
    try {
      Map<String, dynamic> query = {'filter': 'product_id="$productId"'};

      var response = await dio.get(
        'collections/variants/records',
        queryParameters: query,
      );
      return response.data['items']
          .map<Variant>((jsonObject) => Variant.fromJson(jsonObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('گزینه ای برای این محصول وجود ندارد');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<List<VariantType>> getVariantTypes() async {
    try {
      var response = await dio.get('collections/variants_type/records');
      return response.data['items']
          .map<VariantType>((jsonObject) => VariantType.fromJson(jsonObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('گزینه ای برای این محصول وجود ندارد');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<List<ProductVariant>> getProductVariants(String productId) async {
    var variants = await getVariants(productId);
    var variantTypes = await getVariantTypes();

    List<ProductVariant> productVariantList = [];

    try {
      for (var variantType in variantTypes) {
        var finalVariant = variants
            .where((element) => element.typeId == variantType.id)
            .toList();
        productVariantList.add(ProductVariant(finalVariant, variantType));
      }
      return productVariantList;
    } on DioError catch (_) {
      throw ApiExeption('گزینه ای برای این محصول وجود ندارد');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<List<PropertyModel>> getProperties(String productId) async {
    try {
      Map<String, dynamic> query = {'filter': 'product_id="$productId"'};

      var response = await dio.get(
        'collections/properties/records',
        queryParameters: query,
      );
      return response.data['items']
          .map<PropertyModel>(
              (jsonObject) => PropertyModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('مشخصات فنی برای این محصول وجود ندارد');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }

  // @override
  // Future<int> getProductFinalPrice(ProductModel product) async {
  //   try {
  //     var variantList = await getVariants(product.id);

  //     var finalPrice = variantList.fold(product.realPrice,
  //         (accelerometer, element) => accelerometer! + element.priceChange);

  //     return finalPrice!;
  //   } on DioError catch (_) {
  //     throw ApiExeption('مشخصات فنی برای این محصول وجود ندارد');
  //   } catch (_) {
  //     throw ApiExeption('مشکلی در سرور پیش آمده');
  //   }
  // }
}
