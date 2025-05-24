// lib/repository/product_repository.dart
import '../model/product_model.dart';
import '../service/product_service.dart';
import '../cache/product_cache.dart';

class ProductRepository {
  final ProductService service;
  final ProductCache cache;

  ProductRepository({required this.service, required this.cache});

  Future<List<ProductModel>> getProducts() async {
    if (cache.products != null && cache.products!.isNotEmpty) {
      return cache.products!;
    }

    final products = await service.getProducts();
    cache.saveProducts(products);
    return products;
  }
  Future<void> refreshProducts() async {
  final products = await service.getProducts();
  cache.saveProducts(products);
}

}
