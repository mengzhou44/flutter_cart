import 'package:flutter/material.dart';

import 'catalog-model.dart';

class CartModel extends ChangeNotifier {
  List<Item> cartItems = [];

  void add(Item item) {
    var found =
        cartItems.singleWhere((i) => i.name == item.name, orElse: () => null);

    if (found != null) {
      found.quantities = found.quantities + 1;
    } else {
      cartItems.add(item);
    }

    notifyListeners();
  }

  double get totalAmount => cartItems.fold(
      0, (total, current) => total + current.unitPrice * current.quantities);
}
