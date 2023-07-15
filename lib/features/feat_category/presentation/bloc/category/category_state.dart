part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

// loading
class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

// completed
class CategoryCompleted extends CategoryState {
  final Either<String, List<CategoryModel>> categories;
  const CategoryCompleted(this.categories);

  @override
  List<Object> get props => [categories];
}
