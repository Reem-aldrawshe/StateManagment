import 'package:water_delivery/service/product_service.dart';
import 'package:water_delivery/model/company_model.dart';
import 'package:water_delivery/model/offer_model.dart';

class ProductRepository {
  final ProductService service;

  ProductRepository({required this.service});

  Future<List<CompanyModel>> fetchCompanies() async {
    return await service.getCompanies();
  }

  Future<List<OfferModel>> fetchOffers({int? companyId}) async {
    return await service.getOffers(companyId: companyId);
  }
}
