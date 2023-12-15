part of 'get_all_products_bloc.dart';

abstract class GetAllProductsState extends Equatable {
  const GetAllProductsState();
}

class GetAllProductsLoading extends GetAllProductsState {
  @override
  List<Object> get props => [];
}

class GetAllProductsCompleted extends GetAllProductsState {
  final Either<String, List<ProductModel>> response;
  const GetAllProductsCompleted(this.response);

  @override
  List<Object> get props => [];
}
