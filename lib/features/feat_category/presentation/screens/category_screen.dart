import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/app_header.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: CustomScrollView(
          slivers: [
            // app header
            const SliverToBoxAdapter(
              child: AppHeader(title: 'دسته بندی'),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: Dimens.twenty,
                right: Dimens.twenty,
                top: Dimens.thirtytwo,
                bottom: Dimens.twenty,
              ),
              sliver: SliverGrid.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Dimens.twenty,
                  mainAxisSpacing: Dimens.twenty,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
