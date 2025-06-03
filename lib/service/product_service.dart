import 'package:dio/dio.dart';
import 'package:water_delivery/model/company_model.dart';
import 'package:water_delivery/model/offer_model.dart';

class ProductService {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://zamzaam.onrender.com/offers/?skip=0&limit=100'));

  Future<List<CompanyModel>> getCompanies() async {
    final response = await dio.get('/companies');
    return (response.data as List)
        .map((json) => CompanyModel.fromJson(json))
        .toList();
  }

  Future<List<OfferModel>> getOffers({int? companyId}) async {
    final response = await dio.get('/offers');
    return (response.data as List)
        .map((json) => OfferModel.fromJson(json))
        .toList();
  }

  Future<List<OfferModel>> getOffersByCompany(int companyId) async {
  final response = await dio.get('/companies/$companyId/offers');
  return (response.data as List)
      .map((json) => OfferModel.fromJson(json))
      .toList();
}

}
