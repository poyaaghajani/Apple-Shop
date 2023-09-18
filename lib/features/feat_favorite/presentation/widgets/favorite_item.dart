import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/extensions/price_formatter.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/cached_image.dart';
import 'package:apple_shop/core/widgets/custom_snackbar.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_favorite/data/datasource/favorite_datasource.dart';
import 'package:apple_shop/features/feat_favorite/presentation/bloc/favorite_bloc.dart';
import 'package:apple_shop/locator.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    IFavoriteDatasource favorite = locator.get();

    return Container(
      margin: const EdgeInsets.only(bottom: Dimens.twenty),
      padding: const EdgeInsets.all(Dimens.eight),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: DevSize.getWidth(context) / 3.5,
            child: CachedImage(
              imageUrl: product.thumbnail,
            ),
          ),
          const SizedBox(width: Dimens.eight),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: DevSize.getWidth(context) / 2.5,
                child: Text(
                  product.name,
                  style: textTheme.bodySmall,
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: Dimens.eight),
              Text(
                product.price.priceFormatter(),
                style: textTheme.labelSmall!.apply(
                  color: CustomColors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                product.realPrice!.priceFormatter(),
                style: textTheme.bodySmall!.apply(),
              ),
              const SizedBox(height: Dimens.twenty),
              Text(
                product.quantity > 0
                    ? '${product.quantity.toString()} عدد موجود در انبار'
                    : 'ناموجود',
                style: textTheme.labelSmall!
                    .apply(color: CustomColors.green)
                    .copyWith(fontSize: 11),
              ),
            ],
          ),
          DottedLine(
            direction: Axis.vertical,
            lineLength: DevSize.getHeight(context) / 7,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: CustomColors.grey,
            dashGapLength: 4.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    favorite.removeFromFavorite(product);
                    context.read<FavoriteBloc>().add(GetAllFavoriteProducts());
                    CustomSnackbar.showSnack(
                      context: context,
                      icon: SvgPicture.asset(AssetsManager.snackGreen),
                      title: 'موفقیت آمیز',
                      titleColor: CustomColors.green,
                      message: 'محصول از لیست حذف شد',
                    );
                  },
                  child: SvgPicture.asset(
                    AssetsManager.deleteBig,
                    colorFilter: const ColorFilter.mode(
                      CustomColors.red,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
