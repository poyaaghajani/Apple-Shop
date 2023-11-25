part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();
}

// loading
class ProductDetailLoading extends ProductDetailState {
  @override
  List<Object> get props => [];
}

//completed
class PrductDetailCompleted extends ProductDetailState {
  final Either<String, List<ProductGallery>> productGallery;
  final Either<String, List<ProductVariant>> productVariants;
  final Either<String, List<PropertyModel>> properties;
  final Either<String, CategoryModel> productCategory;
  final Either<String, CommentModel> comments;

  const PrductDetailCompleted(
    this.productGallery,
    this.productVariants,
    this.properties,
    this.productCategory,
    this.comments,
  );

  @override
  List<Object> get props => [
        productGallery,
        productVariants,
        properties,
        productCategory,
        comments,
      ];
}
