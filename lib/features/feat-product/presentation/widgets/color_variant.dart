import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/extensions/color_parser.dart';
import 'package:apple_shop/features/feat-product/data/models/product_variant.dart';
import 'package:apple_shop/features/feat-product/data/models/variant.dart';
import 'package:flutter/material.dart';

class ColorVariant extends StatelessWidget {
  const ColorVariant({super.key, required this.productVariants});

  final List<ProductVariant> productVariants;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(
        right: Dimens.twenty,
        bottom: Dimens.twenty,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productVariants[0].variantType.title,
            style: textTheme.bodySmall!.copyWith(fontSize: 13),
          ),
          const SizedBox(height: Dimens.ten),
          ColorVariantGenerator(variantList: productVariants[0].variant),
        ],
      ),
    );
  }
}

class ColorVariantGenerator extends StatefulWidget {
  const ColorVariantGenerator({super.key, required this.variantList});

  final List<Variant> variantList;

  @override
  State<ColorVariantGenerator> createState() => _ColorVariantGeneratorState();
}

class _ColorVariantGeneratorState extends State<ColorVariantGenerator> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.variantList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: selectedIndex == index ? 54 : 26,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: widget.variantList[index].value.parsToColor(),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}
