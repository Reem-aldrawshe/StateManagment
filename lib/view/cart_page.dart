import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartManager>(
      builder: (context, cartManager, _) => Scaffold(
        appBar: AppBar(
          title: Text(' Total price: ${cartManager.getFullTotalPrice()} ل.س'),
        ),
        body: ListView.builder(
          itemCount: cartManager.carts.length,
          itemBuilder: (context, index) {
            final cart = cartManager.carts[index];
            return ExpansionTile(
              title: Text(" restId : ${cart.restid}"),
              children: [
                ...cart.products.map((product) => ListTile(
                      leading: CircleAvatar(
                        child: Text(product.quantity.toString()),
                      ),
                      title: Text(product.name),
                      subtitle: Text("${product.price} "),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' Total price : ${cart.getTotalPrice()} ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
