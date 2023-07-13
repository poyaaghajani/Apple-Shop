import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketItem extends StatelessWidget {
  const BasketItem({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(Dimens.twelve),
      margin: const EdgeInsets.only(
        bottom: Dimens.twenty,
      ),
      height: DevSize.getHeight(context) / 3.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/iphone.png'),
                  ],
                ),
                const SizedBox(width: Dimens.eightTeen),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ایفون ماکس پاکس',
                      style: textTheme.bodyMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: Dimens.twelve),
                      child: Row(
                        children: [
                          Text(
                            '140000550 تومان',
                            style: textTheme.bodySmall!.apply(
                              color: CustomColors.grey,
                            ),
                          ),
                          const SizedBox(width: Dimens.eight),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomColors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              child: Center(
                                child: Text(
                                  '4%',
                                  style: textTheme.labelSmall!.apply(
                                    color: CustomColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: Dimens.twenty),
                      child: Wrap(
                        spacing: Dimens.ten,
                        runSpacing: Dimens.eight,
                        direction: Axis.horizontal,
                        children: [
                          ItemChip(
                            text: 'حذف',
                            widget: SvgPicture.asset(AssetsManager.bin),
                          ),
                          ItemChip(
                            text: 'قرمز',
                            widget: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          ItemChip(
                            text: 'ذخیره',
                            widget: SvgPicture.asset(AssetsManager.favActive,
                                height: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: CustomColors.grey,
            dashGapLength: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.eightTeen),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('1600000', style: textTheme.bodyMedium),
                const SizedBox(width: Dimens.eight),
                Text(
                  'تومان',
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemChip extends StatelessWidget {
  const ItemChip({
    super.key,
    required this.text,
    required this.widget,
  });

  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: CustomColors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
        child: Row(
          children: [
            Text(
              text,
              style: textTheme.labelSmall!.apply(
                color: CustomColors.grey,
              ),
            ),
            const SizedBox(width: 4),
            widget,
          ],
        ),
      ),
    );
  }
}
