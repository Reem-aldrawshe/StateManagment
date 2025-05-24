import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_bloc4/model/cart_model.dart';
import 'package:intro_to_bloc4/model/product_model.dart';

class ProductService {
  Dio requestHandler;
  late Response response;
  String baseurl = "https://67c49863c4649b9551b4125e.mockapi.io/Product";
  ProductService({required this.requestHandler});
  CartModel? cartModel;
  Future<List<ProductModel>> getProducts() async {
  try {
    final response = await requestHandler.get(baseurl);
    final List<ProductModel> products = List<ProductModel>.from(
      response.data.map((item) => ProductModel.fromMap(item)),
    );
    return products;
  } catch (e) {
    throw Exception("Error fetching products: $e");
  }
}
}
