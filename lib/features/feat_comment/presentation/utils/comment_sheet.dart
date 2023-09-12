import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/widgets/loading_widget.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_comment/presentation/bloc/get_comment_bloc.dart';
import 'package:apple_shop/features/feat_comment/presentation/widgets/comment_box.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> commentSheet(
  BuildContext context,
  TextTheme textTheme,
  ProductModel item,
) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    context: context,
    builder: (context) => BlocProvider<GetCommentBloc>.value(
      value: locator.get()..add(GetCommetsRequest(item.id, 1)),
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 0.7,
        expand: false,
        builder: (context, scrollController) {
          return BlocBuilder<GetCommentBloc, GetCommentState>(
            builder: (context, state) {
              return switch (state) {
                GetCommentLoading() => const Center(child: LoadingWidget()),
                GetCommentCompleted() => state.comment.fold(
                    (error) {
                      return Center(
                        child: Text(error),
                      );
                    },
                    (success) {
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: Dimens.twentyFour),
                        controller: scrollController,
                        itemCount: success.items!.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            int totalComments = success.totalItems!;
                            int totalPage = success.totalPages!;
                            int page = success.page!;

                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.eight,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: Dimens.twenty,
                                left: Dimens.eight,
                                right: Dimens.eight,
                              ),
                              decoration: BoxDecoration(
                                color: CustomColors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: CustomColors.blue,
                                ),
                              ),
                              child: Material(
                                color: CustomColors.white,
                                child: Row(
                                  children: [
                                    IconButton(
                                      splashRadius: 20,
                                      onPressed: () {
                                        if (page > 1) {
                                          context.read<GetCommentBloc>().add(
                                              GetCommetsRequest(
                                                  item.id, page--));
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        color: CustomColors.deepGrey,
                                        size: 16,
                                      ),
                                    ),
                                    Text(
                                      'صفحه $page از $totalPage',
                                      style: textTheme.titleSmall!
                                          .apply(color: CustomColors.deepGrey),
                                    ),
                                    IconButton(
                                      splashRadius: 20,
                                      onPressed: () {
                                        if (page != totalPage) {
                                          context.read<GetCommentBloc>().add(
                                              GetCommetsRequest(
                                                  item.id, page++));
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: CustomColors.deepGrey,
                                        size: 16,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '$totalComments کامنت برای محصول ',
                                      style: textTheme.titleSmall!
                                          .apply(color: CustomColors.deepGrey),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            var item = success.items![index - 1];
                            return CommentBox(item: item);
                          }
                        },
                      );
                    },
                  ),
              };
            },
          );
        },
      ),
    ),
  );
}
