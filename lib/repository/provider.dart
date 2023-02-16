import 'dart:convert';
import 'package:ellipsis_digital_commerce/constants.dart';
import 'package:ellipsis_digital_commerce/models/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'provider.g.dart';

@riverpod
class Products extends _$Products {
  @override
  FutureOr<List<Product>> build() => _fetchProducts;

  Future<List<Product>> get _fetchProducts async {
    final respose = await http.get(Uri.parse(restAPI));
    if (respose.statusCode == 200) {
      final data = jsonDecode(respose.body);
      return [for (final item in data) _productFromMap(item)];
    } else {
      throw Exception('Failed to load products, please try again');
    }
  }

  Product _productFromMap(Map<String, dynamic> map) => Product(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      category: map['category'],
      imageURL: map['image'],
      rate: map['rating']['rate'],
      count: map['rating']['count']);
}
