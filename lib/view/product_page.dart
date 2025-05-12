import 'package:flutter/material.dart';
import 'package:intro_to_provider_and_streaming/model/product_model.dart';
import 'package:intro_to_provider_and_streaming/provider/cart_manager.dart';
import 'package:intro_to_provider_and_streaming/view/cart_page.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});
  List<ProductModel> products = [
    ProductModel(id: 1, name: "Banana", price: 2000, restid: 1),
    ProductModel(id: 2, name: "Apple", price: 1000, restid: 1),
    ProductModel(id: 3, name: "Kiwi", price: 3000, restid: 2),
    ProductModel(id: 4, name: "Orange", price: 4000, restid: 3),
  ];

 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartManager(),
      child: Consumer<CartManager>(
        builder: (context, cart, _) {
          // print(products.length);
          return Scaffold(
            appBar: AppBar(title: const Text("Products")),
            body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(products[index].name),
                // tileColor: Colors.red,
              subtitle: Text("price: ${products[index].price}"),
                onTap: () {
                  cart.updateCart(products[index]);
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>
                   ChangeNotifierProvider.value(
                    value: cart,
                    child: CartPage())),
                );
              },
              
            ),
          );
        },
      ),
    );
  }
}
