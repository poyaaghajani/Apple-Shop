part of 'add_comment_bloc.dart';

sealed class AddCommentEvent extends Equatable {
  const AddCommentEvent();
}

class AddCommentRequest extends AddCommentEvent {
  final String? text;
  final String? userId;
  final String? productId;

  const AddCommentRequest({
    required this.text,
    this.userId,
    required this.productId,
  });

  @override
  List<Object?> get props => [text, userId, productId];
}
