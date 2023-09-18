part of 'get_comment_bloc.dart';

sealed class GetCommentState extends Equatable {
  const GetCommentState();
}

// loading state
final class GetCommentLoading extends GetCommentState {
  @override
  List<Object> get props => [];
}

// completed state
final class GetCommentCompleted extends GetCommentState {
  final Either<String, CommentModel> comment;
  const GetCommentCompleted(this.comment);

  @override
  List<Object> get props => [comment];
}
