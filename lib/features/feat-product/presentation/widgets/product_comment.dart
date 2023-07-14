import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductComments extends StatelessWidget {
  const ProductComments({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverPadding(
      padding: const EdgeInsets.only(top: Dimens.twenty),
      sliver: SliverToBoxAdapter(
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
                Text(' نظرات کاربران::', style: textTheme.labelSmall),
                const SizedBox(width: Dimens.eight),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CommentItem(color: Colors.red),
                    const Positioned(
                      right: 15,
                      child: CommentItem(color: Colors.teal),
                    ),
                    const Positioned(
                      right: 30,
                      child: CommentItem(color: Colors.amber),
                    ),
                    const Positioned(
                      right: 45,
                      child: CommentItem(color: Colors.blue),
                    ),
                    Positioned(
                      right: 60,
                      child: Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '+10',
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
                Text('مشاهده', style: textTheme.labelSmall),
                const SizedBox(width: 10),
                SvgPicture.asset(AssetsManager.arrowLeftBlue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
