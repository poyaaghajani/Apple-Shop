import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat-product/data/repository/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'product_popularity_event.dart';
part 'product_popularity_state.dart';

class ProductPopularityBloc
    extends Bloc<ProductPopularityEvent, ProductPopularityState> {
  IProductRepository productRepository;

  ProductPopularityBloc(this.productRepository)
      : super(ProductPopularityLoading()) {
    on<ProductPopularityRequest>(onProductPopularityRequest);
  }

  onProductPopularityRequest(ProductPopularityRequest event,
      Emitter<ProductPopularityState> emit) async {
    var productPopularity =
        await productRepository.getProductPopularity(event.popularity);

    emit(ProductPopularityCompleted(productPopularity));
  }
}
