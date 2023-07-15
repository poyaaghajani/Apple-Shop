import 'package:apple_shop/features/feat_category/data/models/category_model.dart';
import 'package:apple_shop/features/feat_category/data/repository/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  ICategoryRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryLoading()) {
    on<CategoryRequest>(onCategoryRequest);
  }

  onCategoryRequest(CategoryRequest event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());

    var categories = await categoryRepository.getCategories();

    emit(CategoryCompleted(categories));
  }
}
