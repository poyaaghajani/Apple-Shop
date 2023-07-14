import 'package:apple_shop/core/constants/dimens.dart';
import 'package:flutter/material.dart';

class ColorVariant extends StatelessWidget {
  const ColorVariant({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverPadding(
      padding: const EdgeInsets.only(right: Dimens.twenty),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'انتخاب رنگ',
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
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: 26,
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
