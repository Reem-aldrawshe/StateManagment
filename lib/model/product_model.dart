class ProductModel {
  int id;
  String name;
  double price;
  int quantity = 1;
  int restid;

  ProductModel({required this.id, required this.name, required this.price, required this.restid,});


  ProductModel copyWith({
    int? id,
    String? name,
    double? price,
    int? restId,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      restid: restId ?? this.restid,
    );
  }
}
