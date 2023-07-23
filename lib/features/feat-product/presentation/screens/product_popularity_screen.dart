import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/app_header.dart';
import 'package:apple_shop/core/widgets/loading_widget.dart';
import 'package:apple_shop/core/widgets/product_item.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat-product/presentation/bloc/product_popularity/product_popularity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductPopularityScreen extends StatefulWidget {
  const ProductPopularityScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductPopularityScreen> createState() =>
      _ProductPopularityScreenState();
}

class _ProductPopularityScreenState extends State<ProductPopularityScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductPopularityBloc>(context)
        .add(ProductPopularityRequest(widget.product.popularity));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: SafeArea(
        child: BlocBuilder<ProductPopularityBloc, ProductPopularityState>(
          builder: (context, state) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: CustomScrollView(
                slivers: [
                  if (state is ProductPopularityLoading) ...[
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
                  if (state is ProductPopularityCompleted) ...[
                    // app header
                    SliverToBoxAdapter(
                      child: AppHeader(
                        title: (widget.product.popularity == 'Hotest')
                            ? 'پربازدید ترین ها'
                            : 'پرفروش ترین ها',
                        widget: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(AssetsManager.arrowRightDark),
                        ),
                      ),
                    ),

                    // product grid
                    state.productPopularity.fold((errorMessage) {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: DevSize.getHeight(context) / 4.5,
                          child: Center(
                            child:
                                Text(errorMessage, style: textTheme.bodySmall),
                          ),
                        ),
                      );
                    }, (products) {
                      return SliverPadding(
                        padding: const EdgeInsets.only(
                          left: Dimens.twenty,
                          right: Dimens.twenty,
                          top: Dimens.thirtytwo,
                          bottom: Dimens.twenty,
                        ),
                        sliver: SliverGrid.builder(
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: Dimens.twenty,
                            mainAxisSpacing: Dimens.twenty,
                          ),
                          itemBuilder: (context, index) {
                            return ProductItem(product: products[index]);
                          },
                        ),
                      );
                    })
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
