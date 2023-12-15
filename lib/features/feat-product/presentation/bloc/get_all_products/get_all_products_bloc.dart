import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat-product/data/repository/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  final IProductRepository repository;

  GetAllProductsBloc(this.repository) : super(GetAllProductsLoading()) {
    on<GetAllProductsRequest>(onGetAllProductsRequest);
  }

  onGetAllProductsRequest(
      GetAllProductsRequest evnet, Emitter<GetAllProductsState> emit) async {
    emit(GetAllProductsLoading());

    var response = await repository.getAllProducts();

    emit(GetAllProductsCompleted(response));
  }
}
