part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

// category request
class CategoryRequest extends CategoryEvent {
  @override
  List<Object> get props => [];
}
