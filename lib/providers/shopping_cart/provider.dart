import 'package:ellipsis_digital_commerce/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.dart';
part 'provider.freezed.dart';

class ShoppingCartProvider extends ChangeNotifier {
  ShoppingCartState state = _defaultState;

  void addProduct(Product product) {
    final products = {...state.products};
    products.update(product, (value) => value + 1, ifAbsent: () => 1);
    state = state.copyWith(products: products);
    notifyListeners();
  }

  void changeNumberOfProductCount(
      {required Product product, bool increment = true}) {
    final products = {...state.products};
    products.update(product, (value) => increment ? value + 1 : value - 1);
    state = state.copyWith(products: products);
    notifyListeners();
  }

  void removeProduct(int id) {
    final products = {...state.products};
    products.removeWhere((key, value) => key.id == id);
    state = state.copyWith(products: products);
    notifyListeners();
  }

  void clearCart() {
    state = _defaultState;
    notifyListeners();
  }

  void checkOut() => clearCart();
}
