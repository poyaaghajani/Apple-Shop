import 'package:apple_shop/core/constants/app_defaults.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/cached_image.dart';
import 'package:apple_shop/features/feat_home/data/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.controller,
    required this.banners,
  });

  final PageController controller;

  final List<BannerModel> banners;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: Dimens.thirtytwo),
      sliver: SliverToBoxAdapter(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: DevSize.getHeight(context) / 4.5,
              child: PageView.builder(
                physics: AppDef.defPhycics,
                controller: controller,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedImage(
                        imageUrl: banners[index].thumbnail,
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10,
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotHeight: 6,
                  dotWidth: 6,
                  dotColor: Colors.white,
                  activeDotColor: CustomColors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
