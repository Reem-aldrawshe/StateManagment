import 'package:water_delivery/model/company_model.dart';
import 'package:water_delivery/service/company_service.dart';

class CompanyRepository {
  final CompanyService _companyService;

  CompanyRepository(this._companyService);

  Future<List<CompanyModel>> getCompanies() {
    return _companyService.fetchCompanies();
  }
}
