import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/auth_manager.dart';
import 'package:apple_shop/core/widgets/loading_widget.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_comment/presentation/bloc/add_comment/add_comment_bloc.dart';
import 'package:apple_shop/features/feat_comment/presentation/bloc/get_comment/get_comment_bloc.dart';
import 'package:apple_shop/features/feat_comment/presentation/widgets/comment_box.dart';
import 'package:apple_shop/features/feat_comment/presentation/widgets/first_item.dart';
import 'package:apple_shop/features/feat_comment/presentation/widgets/send_comment_box.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> commentSheet(
  BuildContext context,
  TextTheme textTheme,
  ProductModel item,
) {
  final TextEditingController commentController = TextEditingController();
  int page = 1;
  var userId = AuthManager.readUserId();

  return showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    context: context,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator.get<GetCommentBloc>()
            ..add(GetCommetsRequest(item.id, page)),
        ),
        BlocProvider(create: (context) => locator.get<AddCommentBloc>()),
      ],
      child: StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.2,
              maxChildSize: 0.7,
              expand: false,
              builder: (context, scrollController) {
                return BlocBuilder<GetCommentBloc, GetCommentState>(
                  builder: (context, state) {
                    return switch (state) {
                      GetCommentLoading() =>
                        const Center(child: LoadingWidget()),
                      GetCommentCompleted() => state.comment.fold(
                          (error) {
                            return Center(
                              child: Text(
                                error,
                                style: textTheme.titleSmall,
                              ),
                            );
                          },
                          (success) {
                            return Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(
                                        top: Dimens.twentyFour),
                                    controller: scrollController,
                                    itemCount: success.items!.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index == 0) {
                                        int totalComments = success.totalItems!;
                                        int totalPage = success.totalPages!;
                                        page = success.page!;

                                        // first item
                                        return CommentFirstItem(
                                            totalComments: totalComments,
                                            totalPage: totalPage,
                                            page: page,
                                            decrementPressed: () {
                                              if (page > 1) {
                                                setState(() {
                                                  page--;
                                                });
                                                context
                                                    .read<GetCommentBloc>()
                                                    .add(GetCommetsRequest(
                                                        item.id, page--));
                                              }
                                            },
                                            incrementPressed: () {
                                              if (page != totalPage) {
                                                setState(() {
                                                  page++;
                                                });
                                                context
                                                    .read<GetCommentBloc>()
                                                    .add(GetCommetsRequest(
                                                        item.id, page++));
                                              }
                                            });
                                      } else {
                                        var item = success.items![index - 1];
                                        return CommentBox(item: item);
                                      }
                                    },
                                  ),
                                ),

                                // send comment box
                                SendCommentBox(
                                  commentController: commentController,
                                  page: page,
                                  userId: userId,
                                  item: item,
                                ),
                              ],
                            );
                          },
                        ),
                    };
                  },
                );
              },
            ),
          );
        },
      ),
    ),
  );
}
