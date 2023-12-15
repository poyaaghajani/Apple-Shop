part of 'get_all_products_bloc.dart';

abstract class GetAllProductsEvent extends Equatable {
  const GetAllProductsEvent();

  @override
  List<Object> get props => [];
}

// get all products request
class GetAllProductsRequest extends GetAllProductsEvent {}
