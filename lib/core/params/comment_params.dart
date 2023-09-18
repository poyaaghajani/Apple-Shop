class CommentParams {
  final String? text;
  final String? userId;
  final String? productId;

  CommentParams({
    required this.text,
    this.userId,
    required this.productId,
  });
}
