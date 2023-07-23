import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isVisable = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverPadding(
      padding: const EdgeInsets.only(top: Dimens.twenty),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isVisable = !isVisable;
                });
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
                      Text(' توضیحات محصول:', style: textTheme.labelSmall),
                      const Spacer(),
                      Text(
                        'مشاهده',
                        style: textTheme.labelSmall!
                            .apply(color: CustomColors.blue),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(AssetsManager.arrowLeftBlue),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Visibility(
              visible: isVisable,
              child: Container(
                width: DevSize.getWidth(context),
                margin: const EdgeInsets.symmetric(horizontal: Dimens.twenty),
                padding: const EdgeInsets.all(Dimens.eight),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: CustomColors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    widget.productModel.description.isNotEmpty
                        ? widget.productModel.description
                        : 'درحال حاضر توضیحاتی برای این محصول وجود ندارد',
                    textAlign: TextAlign.start,
                    style: textTheme.labelSmall!.copyWith(height: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
