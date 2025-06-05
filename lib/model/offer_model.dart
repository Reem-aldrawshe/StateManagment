class OfferModel {
  final String id;
  final String name;
  final double price;
  final String companyId;
  final String description; 

  OfferModel({
    required this.id,
    required this.name,
    required this.price,
    required this.companyId,
    required this.description, 
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      companyId: json['company_id'].toString(),
      description: json['description'] ?? '', 
    );
  }
}
