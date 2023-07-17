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

  const PrductDetailCompleted(
    this.productGallery,
    this.productVariants,
    this.properties,
  );

  @override
  List<Object> get props => [
        productGallery,
        productVariants,
        properties,
      ];
}
