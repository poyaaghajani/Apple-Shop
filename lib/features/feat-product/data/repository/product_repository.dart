import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/feat-product/data/datasource/product_datasource.dart';
import 'package:apple_shop/features/feat-product/data/models/product_gallery.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat-product/data/models/product_variant.dart';
import 'package:apple_shop/features/feat-product/data/models/property_model.dart';
import 'package:apple_shop/features/feat-product/data/models/variant.dart';
import 'package:apple_shop/features/feat-product/data/models/variant_type.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<String, List<ProductModel>>> getHotestProducts();
  Future<Either<String, List<ProductModel>>> getBestSellerProducts();
  Future<Either<String, List<ProductGallery>>> getProductGallery(
      String productId);
  Future<Either<String, List<ProductModel>>> getProductPopularity(
      String popularity);
  Future<Either<String, List<Variant>>> getVariants(String productId);
  Future<Either<String, List<VariantType>>> getVariantTypes();
  Future<Either<String, List<ProductVariant>>> getProductVariants(
      String productId);
  Future<Either<String, List<PropertyModel>>> getProperties(String productId);
  Future<Either<String, List<ProductModel>>> getAllProducts();
  // Future<Either<String, int>> getProductFinalPrice(ProductModel product);
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

  @override
  Future<Either<String, List<ProductModel>>> getBestSellerProducts() async {
    try {
      var bestSellers = await datasource.getBestSellerProducts();
      return right(bestSellers);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<Either<String, List<ProductGallery>>> getProductGallery(
      String productId) async {
    try {
      var productGallery = await datasource.getProductGallery(productId);
      return right(productGallery);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getProductPopularity(
      String popularity) async {
    try {
      var productPopularity = await datasource.getProductPopularity(popularity);
      return right(productPopularity);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<Either<String, List<Variant>>> getVariants(String productId) async {
    try {
      var variant = await datasource.getVariants(productId);
      return right(variant);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<Either<String, List<VariantType>>> getVariantTypes() async {
    try {
      var variantTypes = await datasource.getVariantTypes();
      return right(variantTypes);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<Either<String, List<ProductVariant>>> getProductVariants(
      String productId) async {
    try {
      var productVariants = await datasource.getProductVariants(productId);
      return right(productVariants);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  @override
  Future<Either<String, List<PropertyModel>>> getProperties(
      String productId) async {
    try {
      var properties = await datasource.getProperties(productId);
      return right(properties);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  // get all products
  @override
  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    try {
      var products = await datasource.getAllProducts();
      return right(products);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }

  // @override
  // Future<Either<String, int>> getProductFinalPrice(ProductModel product) async {
  //   try {
  //     var properties = await datasource.getProductFinalPrice(product);
  //     return right(properties);
  //   } on ApiExeption catch (ex) {
  //     return left(ex.message ?? 'مشکلی در سرور پیش آمده');
  //   }
  // }
}
