import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc4/cache/product_cache.dart';
import 'package:intro_to_bloc4/repositories/product_repository.dart';
import 'package:intro_to_bloc4/service/product_service.dart';
import 'package:intro_to_bloc4/view/cart/bloc/cart_bloc.dart';
import 'package:intro_to_bloc4/view/cart/producte_detailes_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(
        ProductRepository( service: ProductService(requestHandler: Dio()),
    cache: ProductCache(),
  ),
)..add(ViewCart()),
      child: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                log(state.toString());
                if (state is CartLoaded) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.cart.prodcuts.length,
                          itemBuilder: (context, index) => ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<CartBloc>()
                                      ..add(
                                        ViewOneProduct(
                                          id: state.cart.prodcuts[index].id
                                              .toString(),
                                        ),
                                      ),
                                    child: ProducteDetailesPage(
                                      id: state.cart.prodcuts[index].id,
                                    ),
                                  ),
                                ),
                              );
                            },
                            leading: CircleAvatar(
                              child: Text(
                                state.cart.prodcuts[index].quintity.toString(),
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                context.read<CartBloc>().add(
                                  IncreasProductQuintity(
                                    id: state.cart.prodcuts[index].id
                                        .toString(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.add),
                            ),
                            title: Text(state.cart.prodcuts[index].name),
                            subtitle: Text(
                              state.cart.prodcuts[index].price.toString(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        color: Colors.orange,
                        child: Text(
                          state.cart.totalPrice.toString(),
                          style: TextStyle(fontSize: 38),
                        ),
                      ),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
