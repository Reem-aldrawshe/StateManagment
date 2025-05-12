import 'package:intro_to_provider_and_streaming/model/product_model.dart';

class CartModel {
   int restid;
 List<ProductModel> products;

  CartModel({required this.restid, required this.products});

  int getTotalPrice() {
    int total = 0;
    for (var product in products) {
      total += (product.price * product.quantity).toInt();
    }
    return total;
  }
}
