import 'package:apple_shop/core/constants/app_defaults.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/extensions/color_parser.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/cached_image.dart';
import 'package:apple_shop/features/feat_category/data/models/category_model.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverPadding(
      padding: const EdgeInsets.only(top: Dimens.thirtytwo),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.twenty,
              ),
              child: Text(
                'دسته بندی',
                style: textTheme.displaySmall,
              ),
            ),
            SizedBox(
              height: DevSize.getHeight(context) / 7.5,
              child: ListView.builder(
                physics: AppDef.defPhycics,
                padding: const EdgeInsets.only(
                  right: Dimens.twenty,
                  top: Dimens.eightTeen,
                ),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: Dimens.eightTeen),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: DevSize.getHeight(context) / 14,
                                width: DevSize.getWidth(context) / 6.8,
                                decoration: ShapeDecoration(
                                  color: categories[index].color.parsToColor(),
                                  shadows: [
                                    BoxShadow(
                                      color:
                                          categories[index].color.parsToColor(),
                                      blurRadius: 25,
                                      spreadRadius: -13,
                                      offset: const Offset(0.0, 15),
                                    )
                                  ],
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Center(
                                  child: CachedImage(
                                    imageUrl: categories[index].icon,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: Dimens.ten),
                          Text(
                            categories[index].title ?? 'دسته بندی',
                            style: textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
