part of 'category_detail_bloc.dart';

abstract class CategoryDetalState extends Equatable {
  const CategoryDetalState();
}

// loading
class CategoryDetalLoading extends CategoryDetalState {
  @override
  List<Object> get props => [];
}

// completed
class CategoryDetalCompleted extends CategoryDetalState {
  final Either<String, List<ProductModel>> oneCategory;
  const CategoryDetalCompleted(this.oneCategory);

  @override
  List<Object> get props => [oneCategory];
}
