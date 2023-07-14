import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/faet-product/data/datasource/product_datasource.dart';
import 'package:apple_shop/features/faet-product/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<String, List<ProductModel>>> getHotestProducts();
}

class ProductRepository extends IProductRepository {
  IProductDatasource datasource;
  ProductRepository(this.datasource);

  @override
  Future<Either<String, List<ProductModel>>> getHotestProducts() async {
    try {
      var hotests = await datasource.getHotestProducts();
      return right(hotests);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }
}
