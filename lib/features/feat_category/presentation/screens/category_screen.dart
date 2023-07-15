import 'package:apple_shop/config/route/route.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/app_header.dart';
import 'package:apple_shop/core/widgets/cached_image.dart';
import 'package:apple_shop/core/widgets/loading_widget.dart';
import 'package:apple_shop/features/feat_category/presentation/bloc/category/category_bloc.dart';
import 'package:apple_shop/features/feat_category/presentation/bloc/category_detail/category_detail_bloc.dart';
import 'package:apple_shop/features/feat_category/presentation/screens/category_detail_screen.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequest());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                if (state is CategoryLoading) ...[
                  SliverToBoxAdapter(
                    child: SizedBox(
                      width: DevSize.getWidth(context),
                      height: DevSize.getHeight(context),
                      child: const Center(
                        child: LoadingWidget(),
                      ),
                    ),
                  ),
                ],
                if (state is CategoryCompleted) ...[
                  // app header
                  const SliverToBoxAdapter(
                    child: AppHeader(title: 'دسته بندی'),
                  ),

                  // category grid
                  state.categories.fold((errorMessage) {
                    return SliverToBoxAdapter(
                      child: SizedBox(
                        height: DevSize.getHeight(context),
                        child: Center(
                          child: Text(errorMessage, style: textTheme.bodySmall),
                        ),
                      ),
                    );
                  }, (categories) {
                    return SliverPadding(
                      padding: const EdgeInsets.only(
                        left: Dimens.twenty,
                        right: Dimens.twenty,
                        top: Dimens.thirtytwo,
                        bottom: Dimens.twenty,
                      ),
                      sliver: SliverGrid.builder(
                        itemCount: 8,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: Dimens.twenty,
                          mainAxisSpacing: Dimens.twenty,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.push(BlocProvider(
                                create: (context) =>
                                    locator.get<CategoryDetalBloc>(),
                                child: CategoryDetailScreen(
                                  category: categories[index],
                                ),
                              ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedImage(
                                imageUrl: categories[index].thumbnail,
                                radius: 15,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
