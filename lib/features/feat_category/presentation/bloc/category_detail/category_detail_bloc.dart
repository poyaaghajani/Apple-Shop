import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_category/data/repository/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'category_detail_event.dart';
part 'category_detail_state.dart';

class CategoryDetalBloc extends Bloc<CategoryDetalEvent, CategoryDetalState> {
  ICategoryRepository categoryRepository;

  CategoryDetalBloc(this.categoryRepository) : super(CategoryDetalLoading()) {
    on<CategoryDetailRequest>(onCtegoryDetailRequest);
  }

  onCtegoryDetailRequest(
      CategoryDetailRequest event, Emitter<CategoryDetalState> emit) async {
    var oneCategory = await categoryRepository.getOneCategory(event.catId);

    emit(CategoryDetalCompleted(oneCategory));
  }
}
