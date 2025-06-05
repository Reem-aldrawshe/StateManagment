import 'package:equatable/equatable.dart';
import '../../model/offer_model.dart';
import '../../model/company_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<OfferModel> allOffers;
  final List<OfferModel> filteredOffers;
  final List<CompanyModel> companies;
  final String selectedCompanyId;

  const ProductLoaded({
    required this.allOffers,
    required this.filteredOffers,
    required this.companies,
    required this.selectedCompanyId,
  });

  @override
  List<Object?> get props => [allOffers, filteredOffers, companies, selectedCompanyId];
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
