import 'package:apple_shop/features/feat_comment/data/models/comment_model.dart';
import 'package:apple_shop/features/feat_comment/data/repository/comment_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_comment_event.dart';
part 'get_comment_state.dart';

class GetCommentBloc extends Bloc<GetCommentEvent, GetCommentState> {
  final ICommentRepository repository;

  GetCommentBloc(this.repository) : super(GetCommentLoading()) {
    on<GetCommetsRequest>(onGetCommetsRequest);
  }

  onGetCommetsRequest(
      GetCommetsRequest event, Emitter<GetCommentState> emit) async {
    emit(GetCommentLoading());

    var response = await repository.getAllComments(event.productId, event.page);

    emit(GetCommentCompleted(response));
  }
}
