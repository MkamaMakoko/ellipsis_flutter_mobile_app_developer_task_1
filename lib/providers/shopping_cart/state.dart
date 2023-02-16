part of 'provider.dart';

@freezed
class ShoppingCartState with _$ShoppingCartState {
  const ShoppingCartState._();
  const factory ShoppingCartState({
    required Map<Product, int> products,
  }) = _State;

  double get totalPrice {
    double total = 0;
    for (final product in products.entries) {
      total = total + (product.key.price * product.value);
    }
    return total;
  }

  int get totalProductNumber {
    int total = 0;
    for (final number in products.values) {
      total = total + number;
    }
    return total;
  }
}

const _defaultState = ShoppingCartState(products: {});

