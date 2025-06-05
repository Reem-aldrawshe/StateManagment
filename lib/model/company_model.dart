class CompanyModel {
  final String id;
  final String name;
  final String description;
  final String image;

  CompanyModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
