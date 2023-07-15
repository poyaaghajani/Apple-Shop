import 'package:apple_shop/config/route/route.dart';
import 'package:apple_shop/core/constants/app_defaults.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/extensions/color_parser.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/cached_image.dart';
import 'package:apple_shop/features/feat_category/data/models/category_model.dart';
import 'package:apple_shop/features/feat_category/presentation/bloc/category_detail/category_detail_bloc.dart';
import 'package:apple_shop/features/feat_category/presentation/screens/category_detail_screen.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.push(
                              BlocProvider(
                                create: (context) =>
                                    locator.get<CategoryDetalBloc>(),
                                child: CategoryDetailScreen(
                                    category: categories[index]),
                              ),
                            );
                          },
                          child: Stack(
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
                                    radius: 4,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: Dimens.ten),
                        Text(
                          categories[index].title ?? 'دسته بندی',
                          style: textTheme.labelSmall,
                        ),
                      ],
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
