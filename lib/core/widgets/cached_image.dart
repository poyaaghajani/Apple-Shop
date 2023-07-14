import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final double? radius;
  final BoxFit? fit;
  const CachedImage({
    super.key,
    this.imageUrl,
    this.radius = 0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: fit,
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius!),
                color: Colors.white,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
