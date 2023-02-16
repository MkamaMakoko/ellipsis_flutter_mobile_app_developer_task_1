import 'package:ellipsis_digital_commerce/models/product/product.dart';
import 'package:ellipsis_digital_commerce/providers/sort_products/provider.dart';

List<Product> sortProducts(
    {required SortProductState state, required List<Product> products}) {
  switch (state) {
    case SortProductState.price:
      return [...products]..sort((a, b) => a.price > b.price ? 1 : -1);
    case SortProductState.rating:
      return [...products]..sort((a, b) => a.rate < b.rate ? 1 : -1);
  }
}
