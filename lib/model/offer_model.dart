class OfferModel {
  final int id;
  final String title; // ← بدل name
  final double price;
  final int companyId;

  OfferModel({
    required this.id,
    required this.title,
    required this.price,
    required this.companyId,
  });
  //ليست من الشركات  

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] as num).toDouble(),
      companyId: json['company_id'] ?? 0,
    );
  }
}
