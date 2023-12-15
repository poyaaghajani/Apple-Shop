import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/loading_widget.dart';
import 'package:apple_shop/core/widgets/product_item.dart';
import 'package:apple_shop/features/feat-product/presentation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({super.key});

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  String _searchKey = '';

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  if (state is GetAllProductsLoading) ...[
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
                  if (state is GetAllProductsCompleted) ...[
                    // search bar
                    SliverToBoxAdapter(
                      child: HomeSearchBar(
                        isNavigate: false,
                        readOnly: false,
                        onChanged: (value) {
                          setState(() {
                            _searchKey = value;
                          });
                        },
                      ),
                    ),

                    // products grid
                    state.response.fold(
                      (errorMessage) {
                        return SliverToBoxAdapter(
                          child: SizedBox(
                            height: DevSize.getHeight(context),
                            child: Center(
                              child: Text(errorMessage,
                                  style: textTheme.bodySmall),
                            ),
                          ),
                        );
                      },
                      (products) {
                        var filterList = products
                            .where((element) =>
                                element.name.toLowerCase().contains(_searchKey))
                            .toList();

                        return filterList.isNotEmpty
                            ? SliverPadding(
                                padding: const EdgeInsets.only(
                                  left: Dimens.twenty,
                                  right: Dimens.twenty,
                                  top: Dimens.thirtytwo,
                                  bottom: Dimens.twenty,
                                ),
                                sliver: SliverGrid.builder(
                                  itemCount: filterList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.8,
                                    crossAxisSpacing: Dimens.twenty,
                                    mainAxisSpacing: Dimens.twenty,
                                  ),
                                  itemBuilder: (context, index) {
                                    return ProductItem(
                                      product: filterList[index],
                                    );
                                  },
                                ),
                              )
                            : SliverToBoxAdapter(
                                child: SizedBox(
                                  width: DevSize.getWidth(context),
                                  height: DevSize.getHeight(context),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AssetsManager.emptyFavorite,
                                        width: 200,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: Dimens.eight,
                                          bottom: Dimens.fortyFour,
                                        ),
                                        child: Text(
                                          'محصولی با این اسم برای شما یافت نشد...',
                                          style: textTheme.bodySmall!.apply(
                                            color: CustomColors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
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
