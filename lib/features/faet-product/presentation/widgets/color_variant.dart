import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:flutter/material.dart';

class StorageVariant extends StatelessWidget {
  const StorageVariant({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverPadding(
      padding: const EdgeInsets.only(
        top: Dimens.twenty,
        right: Dimens.twenty,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'انتخاب حافظه',
              style: textTheme.bodySmall,
            ),
            const SizedBox(height: Dimens.ten),
            SizedBox(
              height: 26,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 74,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: CustomColors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('245', style: textTheme.bodySmall),
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
