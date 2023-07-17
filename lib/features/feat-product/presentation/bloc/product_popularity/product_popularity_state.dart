part of 'product_popularity_bloc.dart';

abstract class ProductPopularityState extends Equatable {
  const ProductPopularityState();
}

// loading
class ProductPopularityLoading extends ProductPopularityState {
  @override
  List<Object> get props => [];
}

// completed
class ProductPopularityCompleted extends ProductPopularityState {
  final Either<String, List<ProductModel>> productPopularity;
  const ProductPopularityCompleted(this.productPopularity);

  @override
  List<Object> get props => [productPopularity];
}
