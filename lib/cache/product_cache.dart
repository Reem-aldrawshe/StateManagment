// lib/cache/product_cache.dart
import '../model/product_model.dart';

class ProductCache {
  List<ProductModel>? _cachedProducts;

  List<ProductModel>? get products => _cachedProducts;

  void saveProducts(List<ProductModel> products) {
    _cachedProducts = products;
  }

  void clearCache() {
    _cachedProducts = null;
  }
}
