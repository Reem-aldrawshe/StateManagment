import 'package:water_delivery/model/company_model.dart';
import 'package:water_delivery/model/offer_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<CompanyModel> companies;
  final List<OfferModel> offers;
  final int selectedCompanyId;

  ProductLoaded({
    required this.companies,
    required this.offers,
    required this.selectedCompanyId,
  });
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
