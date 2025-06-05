import 'package:dio/dio.dart';
import '../model/company_model.dart';

class CompanyService {
  final Dio _dio = Dio();

  Future<List<CompanyModel>> fetchCompanies() async {
    final response = await _dio.get(
      'https://zamzaam.onrender.com/companies/',
      queryParameters: {
        'skip': 0,
        'limit': 100,
      },
    );

    final List data = response.data;
    return data.map((e) => CompanyModel.fromJson(e)).toList();
  }
}
