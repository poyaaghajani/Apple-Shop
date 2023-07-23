import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/features/feat-product/data/models/property_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductProperties extends StatefulWidget {
  const ProductProperties({super.key, required this.properties});

  final List<PropertyModel> properties;

  @override
  State<ProductProperties> createState() => _ProductPropertiesState();
}

class _ProductPropertiesState extends State<ProductProperties> {
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
                      Text(' مشخصات فنی:', style: textTheme.labelSmall),
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
                child: widget.properties.isNotEmpty
                    ? ListView.builder(
                        itemCount: widget.properties.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.properties[index].title,
                                  style: textTheme.labelSmall,
                                ),
                                Text(
                                  widget.properties[index].value,
                                  style: textTheme.labelSmall,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'درحال حاضر مشخات فنی برای این محصول وجود ندارد',
                            style: textTheme.labelSmall,
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
