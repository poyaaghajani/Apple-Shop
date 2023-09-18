part of 'add_comment_bloc.dart';

sealed class AddCommentState extends Equatable {
  const AddCommentState();
}

// init state
final class AddCommentInit extends AddCommentState {
  @override
  List<Object?> get props => [];
}

// loading state
final class AddCommentLoading extends AddCommentState {
  @override
  List<Object?> get props => [];
}

// completed state
final class AddCommentCompleted extends AddCommentState {
  final Either<String, String> message;
  const AddCommentCompleted(this.message);

  @override
  List<Object?> get props => [message];
}
