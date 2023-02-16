import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product(
      {required int id,
      required String title,
      required num price,
      required String description,
      required String category,
      required String imageURL,
      required num rate,
      required num count}) = _Product;
}
