import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/widgets/custom_snackbar.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_comment/presentation/bloc/add_comment/add_comment_bloc.dart';
import 'package:apple_shop/features/feat_comment/presentation/bloc/get_comment/get_comment_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendCommentBox extends StatelessWidget {
  const SendCommentBox({
    super.key,
    required this.commentController,
    required this.page,
    required this.userId,
    required this.item,
  });

  final TextEditingController commentController;
  final int page;
  final String userId;
  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.eight),
      child: Row(
        children: [
          BlocConsumer<AddCommentBloc, AddCommentState>(
            listener: (context, state) {
              if (state is AddCommentCompleted) {
                state.message.fold((error) {
                  commentController.clear();
                  CustomSnackbar.showSnack(context, error);
                }, (success) {
                  commentController.clear();
                  context
                      .read<GetCommentBloc>()
                      .add(GetCommetsRequest(item.id, page));
                  CustomSnackbar.showSnack(context, success);
                });
              }
            },
            builder: (context, state) {
              if (state is AddCommentInit) {
                return SendBox(
                  commentController: commentController,
                  item: item,
                  userId: userId,
                );
              }
              if (state is AddCommentLoading) {
                return const CupertinoActivityIndicator();
              }
              if (state is AddCommentCompleted) {
                return state.message.fold((error) {
                  return SendBox(
                    commentController: commentController,
                    item: item,
                    userId: userId,
                  );
                }, (success) {
                  return SendBox(
                    commentController: commentController,
                    item: item,
                    userId: userId,
                  );
                });
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(width: Dimens.eight),
          Expanded(
            child: TextField(
              style: textTheme.titleSmall,
              controller: commentController,
              decoration: const InputDecoration(
                hintText: 'نظر خود را بنویسید...',
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: CustomColors.grey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColors.dark,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// send box
class SendBox extends StatelessWidget {
  const SendBox({
    super.key,
    required this.commentController,
    required this.item,
    required this.userId,
  });

  final TextEditingController commentController;
  final ProductModel item;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (commentController.text.isNotEmpty) {
          BlocProvider.of<AddCommentBloc>(context).add(AddCommentRequest(
            text: commentController.text,
            productId: item.id,
            userId: userId,
          ));
        }
      },
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(Dimens.eight),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.blue,
        ),
        child: Center(
          child: SvgPicture.asset(
            AssetsManager.send,
            colorFilter: const ColorFilter.mode(
              CustomColors.white,
              BlendMode.srcATop,
            ),
          ),
        ),
      ),
    );
  }
}
