import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/app_header.dart';
import 'package:apple_shop/core/widgets/custom_snackbar.dart';
import 'package:apple_shop/core/widgets/loading_widget.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat-product/data/models/product_variant.dart';
import 'package:apple_shop/features/feat-product/data/models/variant_type.dart';
import 'package:apple_shop/features/feat-product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:apple_shop/features/feat-product/presentation/widgets/add_to_basket_button.dart';
import 'package:apple_shop/features/feat-product/presentation/widgets/color_variant.dart';
import 'package:apple_shop/features/feat-product/presentation/widgets/price_button.dart';
import 'package:apple_shop/features/feat-product/presentation/widgets/storage_variant.dart';
import 'package:apple_shop/features/feat-product/presentation/widgets/product_comment.dart';
import 'package:apple_shop/features/feat-product/presentation/widgets/product_description.dart';
import 'package:apple_shop/features/feat-product/presentation/widgets/product_gallery_box.dart';
import 'package:apple_shop/features/feat-product/presentation/widgets/product_property.dart';
import 'package:apple_shop/features/feat_basket/presentation/bloc/add_basket/add_basket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductDetailBloc>(context).add(ProductDetailRequest(
      widget.product.id,
      widget.product.categoryId,
    ));
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
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  // loading
                  if (state is ProductDetailLoading) ...[
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

                  // app header
                  if (state is PrductDetailCompleted) ...[
                    state.productCategory.fold((l) {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: Dimens.fortyFour,
                          child: Center(
                            child: Text(l, style: textTheme.bodySmall),
                          ),
                        ),
                      );
                    }, (category) {
                      return SliverToBoxAdapter(
                        child: AppHeader(
                          title: category.title ?? 'جزئیات محصول',
                          widget: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                SvgPicture.asset(AssetsManager.arrowRightDark),
                          ),
                        ),
                      );
                    })
                  ],

                  if (state is PrductDetailCompleted) ...[
                    // product title
                    SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: Dimens.thirtytwo),
                          child: Text(
                            widget.product.name,
                            style: textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),

                    // product quantity
                    SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: Dimens.eight),
                          child: Text(
                            widget.product.quantity > 0
                                ? '${widget.product.quantity.toString()} عدد موجود در انبار'
                                : 'ناموجود',
                            style: textTheme.labelSmall!
                                .apply(color: CustomColors.green)
                                .copyWith(fontSize: 11),
                          ),
                        ),
                      ),
                    ),

                    // product gallery
                    state.productGallery.fold((errorMessage) {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: DevSize.getHeight(context) / 4.5,
                          child: Center(
                            child:
                                Text(errorMessage, style: textTheme.bodySmall),
                          ),
                        ),
                      );
                    }, (productGallery) {
                      return ProductGalleryBox(
                        productGallery: productGallery,
                        product: widget.product,
                      );
                    }),
                  ],

                  // product variants
                  if (state is PrductDetailCompleted) ...[
                    state.productVariants.fold((l) {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: DevSize.getHeight(context) / 20,
                          child: Center(
                            child: Text(l),
                          ),
                        ),
                      );
                    }, (productVariantList) {
                      return VariantContainerGenerator(
                        productVariantList: productVariantList,
                      );
                    }),
                  ],

                  // product properties
                  if (state is PrductDetailCompleted) ...[
                    state.properties.fold((errorMessage) {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: DevSize.getHeight(context) / 20,
                          child: Center(
                            child: Text(errorMessage),
                          ),
                        ),
                      );
                    }, (properties) {
                      return ProductProperties(properties: properties);
                    }),

                    // product description
                    ProductDescription(productModel: widget.product),

                    // product comments
                    ProductComments(item: widget.product),

                    // add to basket and prie button
                    SliverPadding(
                      padding: const EdgeInsets.only(
                        top: Dimens.thirtytwo,
                        left: Dimens.twenty,
                        right: Dimens.twenty,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // add to basket button
                            BlocConsumer<AddBasketBloc, AddBasketState>(
                              listener: (context, state) {
                                if (state is AddBasketCompleted) {
                                  state.basket.fold((errorMessage) {
                                    CustomSnackbar.showSnack(
                                        context, errorMessage);
                                  }, (successMessage) {
                                    CustomSnackbar.showSnack(
                                        context, successMessage);
                                  });
                                }
                              },
                              builder: (context, state) {
                                if (state is AddBasketInit) {
                                  return AddToBasketButton(
                                    product: widget.product,
                                  );
                                }
                                if (state is AddBasketCompleted) {
                                  return state.basket.fold((error) {
                                    return AddToBasketButton(
                                      product: widget.product,
                                    );
                                  }, (success) {
                                    return AddToBasketButton(
                                      product: widget.product,
                                    );
                                  });
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),

                            // price button
                            PriceButton(product: widget.product),
                          ],
                        ),
                      ),
                    ),

                    const SliverPadding(
                      padding: EdgeInsets.only(bottom: Dimens.thirtytwo),
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

// show dinamic products variants
class VariantContainerGenerator extends StatelessWidget {
  const VariantContainerGenerator(
      {super.key, required this.productVariantList});

  final List<ProductVariant> productVariantList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          for (var productVariant in productVariantList) ...{
            if (productVariant.variant.isNotEmpty) ...[
              if (productVariant.variantType.type == VariantTypeEnum.color) ...[
                ColorVariant(productVariants: productVariantList),
              ],
              if (productVariant.variantType.type ==
                  VariantTypeEnum.storage) ...[
                StorageVariant(productVariants: productVariantList),
              ],
            ],
          }
        ],
      ),
    );
  }
}
