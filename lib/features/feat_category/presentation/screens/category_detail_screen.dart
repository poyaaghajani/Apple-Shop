import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/app_header.dart';
import 'package:apple_shop/core/widgets/loading_widget.dart';
import 'package:apple_shop/core/widgets/product_item.dart';
import 'package:apple_shop/features/feat_category/data/models/category_model.dart';
import 'package:apple_shop/features/feat_category/presentation/bloc/category_detail/category_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryDetalBloc>(context)
        .add(CategoryDetailRequest(widget.category.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: BlocBuilder<CategoryDetalBloc, CategoryDetalState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  // loading
                  if (state is CategoryDetalLoading) ...[
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

                  // category grid
                  if (state is CategoryDetalCompleted) ...[
                    SliverToBoxAdapter(
                      child: AppHeader(
                          title: widget.category.title ?? 'دسته بندی'),
                    ),
                    state.oneCategory.fold((errorMessage) {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: DevSize.getHeight(context) / 4.5,
                          child: Center(
                            child:
                                Text(errorMessage, style: textTheme.bodySmall),
                          ),
                        ),
                      );
                    }, (category) {
                      return SliverPadding(
                        padding: const EdgeInsets.only(
                          left: Dimens.twenty,
                          right: Dimens.twenty,
                          top: Dimens.thirtytwo,
                          bottom: Dimens.twenty,
                        ),
                        sliver: SliverGrid.builder(
                          itemCount: category.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: Dimens.twenty,
                            mainAxisSpacing: Dimens.twenty,
                          ),
                          itemBuilder: (context, index) {
                            return ProductItem(product: category[index]);
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
      ),
    );
  }
}
