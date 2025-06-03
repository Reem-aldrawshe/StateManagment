import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_delivery/bloc/product/product_event.dart';
import 'package:water_delivery/bloc/product/product_state.dart';
import 'package:water_delivery/repositories/product_repository.dart';
import 'package:water_delivery/model/company_model.dart';
import 'package:water_delivery/model/offer_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  List<CompanyModel> companies = [];
  List<OfferModel> offers = [];
  int selectedCompanyId = 0;

  ProductBloc({required this.repository}) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<FilterProducts>(_onFilterProducts);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      companies = await repository.fetchCompanies();
      offers = await repository.fetchOffers(); // All offers
      selectedCompanyId = 0;
      emit(ProductLoaded(
        companies: companies,
        offers: offers,
        selectedCompanyId: selectedCompanyId,
      ));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  Future<void> _onFilterProducts(FilterProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      selectedCompanyId = int.tryParse(event.query) ?? 0;

      if (selectedCompanyId == 0) {
        offers = await repository.fetchOffers(); // All
      } else {
        offers = await repository.fetchOffers(companyId: selectedCompanyId);
      }

      emit(ProductLoaded(
        companies: companies,
        offers: offers,
        selectedCompanyId: selectedCompanyId,
      ));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
