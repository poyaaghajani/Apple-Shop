import 'package:apple_shop/features/feat-product/data/models/variant.dart';
import 'package:apple_shop/features/feat-product/data/models/variant_type.dart';

class ProductVariant {
  List<Variant> variant;
  VariantType variantType;

  ProductVariant(this.variant, this.variantType);
}
