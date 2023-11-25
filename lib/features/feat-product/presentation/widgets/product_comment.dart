import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat-product/presentation/utils/set_comment_count.dart';
import 'package:apple_shop/features/feat_comment/data/models/comment_model.dart';
import 'package:apple_shop/features/feat_comment/presentation/utils/comment_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductComments extends StatelessWidget {
  const ProductComments({
    super.key,
    required this.item,
    required this.comments,
  });

  final ProductModel item;
  final CommentModel comments;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverPadding(
      padding: const EdgeInsets.only(top: Dimens.twenty),
      sliver: SliverToBoxAdapter(
        child: GestureDetector(
          onTap: () {
            commentSheet(context, textTheme, item);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: Dimens.twenty),
            height: DevSize.getHeight(context) / 17,
            width: DevSize.getWidth(context),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: CustomColors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(' نظرات کاربران:', style: textTheme.labelSmall),
                  const SizedBox(width: Dimens.eight),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      const CommentItem(),
                      const Positioned(
                        right: 15,
                        child: CommentItem(),
                      ),
                      const Positioned(
                        right: 30,
                        child: CommentItem(),
                      ),
                      const Positioned(
                        right: 45,
                        child: CommentItem(),
                      ),
                      Positioned(
                        right: 60,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.blue,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Text(
                              '${setCommentsCount(comments.totalItems!)} +',
                              style: textTheme.titleSmall!.apply(
                                color: CustomColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text('مشاهده',
                      style: textTheme.labelSmall!.apply(
                        color: CustomColors.blue,
                      )),
                  const SizedBox(width: 10),
                  SvgPicture.asset(AssetsManager.arrowLeftBlue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  const CommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Image.asset(
        AssetsManager.user,
      ),
    );
  }
}
