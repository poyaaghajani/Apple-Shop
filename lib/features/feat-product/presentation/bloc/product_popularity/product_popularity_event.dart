part of 'product_popularity_bloc.dart';

abstract class ProductPopularityEvent extends Equatable {
  const ProductPopularityEvent();

  @override
  List<Object> get props => [];
}

// product popolarity request
class ProductPopularityRequest extends ProductPopularityEvent {
  final String popularity;

  const ProductPopularityRequest(this.popularity);
}
