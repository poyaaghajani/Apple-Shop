import 'package:apple_shop/core/params/comment_params.dart';
import 'package:apple_shop/features/feat_comment/data/repository/comment_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'add_comment_event.dart';
part 'add_comment_state.dart';

class AddCommentBloc extends Bloc<AddCommentEvent, AddCommentState> {
  final ICommentRepository repository;

  AddCommentBloc(this.repository) : super(AddCommentInit()) {
    on<AddCommentRequest>(onAddCommentRequest);
  }

  // when user want add new comment, this event will be triggered
  onAddCommentRequest(
      AddCommentRequest event, Emitter<AddCommentState> emit) async {
    emit(AddCommentLoading());

    var message = await repository.addComment(CommentParams(
      text: event.text,
      userId: event.userId,
      productId: event.productId,
    ));

    emit(AddCommentCompleted(message));
  }
}
