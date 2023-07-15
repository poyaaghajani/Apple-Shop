part of 'category_detail_bloc.dart';

abstract class CategoryDetalEvent extends Equatable {
  const CategoryDetalEvent();
}

class CategoryDetailRequest extends CategoryDetalEvent {
  final String catId;
  const CategoryDetailRequest(this.catId);

  @override
  List<Object> get props => [];
}
