import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/features/feat-product/data/models/product_variant.dart';
import 'package:apple_shop/features/feat-product/data/models/variant.dart';
import 'package:flutter/material.dart';

class StorageVariant extends StatelessWidget {
  const StorageVariant({super.key, required this.productVariants});

  final List<ProductVariant> productVariants;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(
        right: Dimens.twenty,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productVariants[1].variantType.title,
            style: textTheme.bodySmall!.copyWith(fontSize: 13),
          ),
          const SizedBox(height: Dimens.ten),
          StorageVariantGenerator(variantList: productVariants[1].variant),
        ],
      ),
    );
  }
}

class StorageVariantGenerator extends StatefulWidget {
  const StorageVariantGenerator({super.key, required this.variantList});

  final List<Variant> variantList;

  @override
  State<StorageVariantGenerator> createState() =>
      _StorageVariantGeneratorState();
}

class _StorageVariantGeneratorState extends State<StorageVariantGenerator> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 26,
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
              margin: const EdgeInsets.only(left: 10),
              width: 74,
              decoration: BoxDecoration(
                color: Colors.white,
                border: (selectedIndex == index)
                    ? Border.all(color: CustomColors.blue, width: 2)
                    : Border.all(color: CustomColors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  widget.variantList[index].value,
                  style: textTheme.bodySmall!.copyWith(fontSize: 13),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
