import 'package:apple_shop/features/feat-product/data/models/product_gallery.dart';
import 'package:apple_shop/features/feat-product/data/models/product_variant.dart';
import 'package:apple_shop/features/feat-product/data/models/property_model.dart';
import 'package:apple_shop/features/feat-product/data/repository/product_repository.dart';
import 'package:apple_shop/features/feat_category/data/models/category_model.dart';
import 'package:apple_shop/features/feat_category/data/repository/category_repository.dart';
import 'package:apple_shop/features/feat_comment/data/models/comment_model.dart';
import 'package:apple_shop/features/feat_comment/data/repository/comment_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  IProductRepository productRepository;
  ICategoryRepository categoryRepository;
  ICommentRepository commentRepository;

  ProductDetailBloc(
    this.productRepository,
    this.categoryRepository,
    this.commentRepository,
  ) : super(ProductDetailLoading()) {
    on<ProductDetailRequest>(onProductDetailRequest);
  }

  onProductDetailRequest(
      ProductDetailRequest event, Emitter<ProductDetailState> emit) async {
    var productGallery =
        await productRepository.getProductGallery(event.productId);
    var productVariants =
        await productRepository.getProductVariants(event.productId);
    var productProperties =
        await productRepository.getProperties(event.productId);
    var productCategory =
        await categoryRepository.getProductCategory(event.catId);
    var comments = await commentRepository.getAllComments(event.productId, 1);

    emit(PrductDetailCompleted(
      productGallery,
      productVariants,
      productProperties,
      productCategory,
      comments,
    ));
  }
}
