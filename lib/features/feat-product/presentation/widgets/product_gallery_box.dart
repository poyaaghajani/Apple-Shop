import 'package:apple_shop/core/constants/app_defaults.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/cached_image.dart';
import 'package:apple_shop/features/feat-product/data/models/product_gallery.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductGalleryBox extends StatefulWidget {
  const ProductGalleryBox({
    super.key,
    required this.productGallery,
    required this.product,
  });

  final List<ProductGallery> productGallery;
  final ProductModel product;

  @override
  State<ProductGalleryBox> createState() => _ProductGalleryBoxState();
}

class _ProductGalleryBoxState extends State<ProductGalleryBox> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.twenty,
          vertical: Dimens.twenty,
        ),
        child: Container(
          height: DevSize.getHeight(context) / 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: Dimens.ten,
                left: Dimens.ten,
                right: Dimens.ten,
                child: Row(
                  children: [
                    SvgPicture.asset(AssetsManager.favActive),
                    const Spacer(),
                    Text('4.6', style: textTheme.bodySmall),
                    const SizedBox(width: 5),
                    SvgPicture.asset(AssetsManager.star),
                  ],
                ),
              ),
              Positioned(
                top: Dimens.eightTeen,
                child: SizedBox(
                  height: DevSize.getHeight(context) / 5.3,
                  width: DevSize.getWidth(context) / 3.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedImage(
                      imageUrl: widget.productGallery.isNotEmpty
                          ? widget.productGallery[currentImage].imageUrl
                          : widget.product.thumbnail,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: DevSize.getHeight(context) / 4.3),
                child: SizedBox(
                  height: DevSize.getHeight(context) / 10,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: Dimens.twenty),
                    itemCount: widget.productGallery.length,
                    physics: AppDef.defPhycics,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentImage = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: Dimens.twenty),
                          padding: const EdgeInsets.all(4),
                          width: DevSize.getWidth(context) / 5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: CustomColors.deepGrey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CachedImage(
                            imageUrl: widget.productGallery[index].imageUrl,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
