import 'package:flutter/material.dart';
part 'state.dart';

class SortProductsProvider extends ChangeNotifier {
  SortProductState state = SortProductState.rating;

  void changeSort(SortProductState sort) {
    state = sort;
    notifyListeners();
  }
}
