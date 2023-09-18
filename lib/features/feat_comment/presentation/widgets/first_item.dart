import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:flutter/material.dart';

class CommentFirstItem extends StatelessWidget {
  const CommentFirstItem({
    super.key,
    required this.totalComments,
    required this.totalPage,
    required this.page,
    required this.decrementPressed,
    required this.incrementPressed,
  });

  final int totalComments;
  final int totalPage;
  final int page;
  final void Function()? decrementPressed;
  final void Function()? incrementPressed;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

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
              onPressed: decrementPressed,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: CustomColors.deepGrey,
                size: 16,
              ),
            ),
            Text(
              'صفحه $page از $totalPage',
              style: textTheme.titleSmall!.apply(color: CustomColors.deepGrey),
            ),
            IconButton(
              splashRadius: 20,
              onPressed: incrementPressed,
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: CustomColors.deepGrey,
                size: 16,
              ),
            ),
            const Spacer(),
            Text(
              '$totalComments کامنت برای محصول ',
              style: textTheme.titleSmall!.apply(color: CustomColors.deepGrey),
            ),
          ],
        ),
      ),
    );
  }
}
