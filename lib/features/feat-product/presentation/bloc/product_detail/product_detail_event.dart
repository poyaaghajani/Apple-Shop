part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
}

// product detail request
class ProductDetailRequest extends ProductDetailEvent {
  final String productId;
  const ProductDetailRequest(this.productId);

  @override
  List<Object> get props => [productId];
}
