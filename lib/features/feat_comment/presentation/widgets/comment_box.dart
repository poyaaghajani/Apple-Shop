import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/extensions/date_formatter.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/cached_image.dart';
import 'package:apple_shop/features/feat_comment/data/models/comment_model.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Dimens.eight,
        horizontal: Dimens.eight,
      ),
      margin: const EdgeInsets.only(
        bottom: Dimens.twenty,
        left: Dimens.eight,
        right: Dimens.eight,
      ),
      decoration: BoxDecoration(
          color: CustomColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
          ]),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: item.avatar != ""
                ? CachedImage(
                    imageUrl: item.userThumnail,
                    radius: 100,
                  )
                : Image.asset(AssetsManager.user),
          ),
          const SizedBox(width: Dimens.eight),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.username! == "" ? 'کاربر' : item.username!,
                style: textTheme.titleSmall,
              ),
              const SizedBox(height: Dimens.eight),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: DevSize.getWidth(context) / 1.7,
                    child: Text(
                      item.text ?? '___',
                      style: textTheme.titleSmall!
                          .copyWith(fontSize: 12)
                          .apply(color: CustomColors.deepGrey),
                    ),
                  ),
                  const SizedBox(width: Dimens.twentyFour),
                  Text(
                    item.created!.jalaliFormatter(),
                    style: textTheme.displaySmall!.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
