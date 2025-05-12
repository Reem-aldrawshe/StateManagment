import 'package:flutter/material.dart';
import 'package:intro_to_provider_and_streaming/model/cart_model.dart';
import 'package:intro_to_provider_and_streaming/model/product_model.dart';

class CartManager extends ChangeNotifier {
  List<CartModel> carts = [];

  void updateCart(ProductModel product) {
    final index = carts.indexWhere((cart) => cart.restid == product.restid);

    if (index != -1) {
      final cart = carts[index];
      final productIndex = cart.products.indexWhere((p) => p.id == product.id);

      if (productIndex != -1) {
        cart.products[productIndex].quantity++;
      } else {
        cart.products.add(product.copyWith(quantity: 1));
      }
    } else {
      carts.add(CartModel(
        restid: product.restid,
        products: [product.copyWith(quantity: 1)],
      ));
    }

    notifyListeners();
  }

  int getFullTotalPrice() {
    int total = 0;
    for (var cart in carts) {
      total += cart.getTotalPrice();
    }
    return total;
  }
}
