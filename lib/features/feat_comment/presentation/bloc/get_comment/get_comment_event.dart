part of 'get_comment_bloc.dart';

sealed class GetCommentEvent extends Equatable {
  const GetCommentEvent();
}

// get comments request
class GetCommetsRequest extends GetCommentEvent {
  final String productId;
  final int page;
  const GetCommetsRequest(this.productId, this.page);

  @override
  List<Object> get props => [productId, page];
}
