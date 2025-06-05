import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../../service/company_service.dart';
import '../../service/offer_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final OfferService offerService;
  final CompanyService companyService;

  ProductBloc({
    required this.offerService,
    required this.companyService,
  }) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<FilterProductsByCompany>(_onFilterProductsByCompany);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final offers = await offerService.fetchOffers();
      final companies = await companyService.fetchCompanies();
      emit(ProductLoaded(
        allOffers: offers,
        filteredOffers: offers,
        companies: companies,
        selectedCompanyId: 'all',
      ));
    } catch (e) {
      emit(ProductError('فشل تحميل البيانات'));
    }
  }

  void _onFilterProductsByCompany(FilterProductsByCompany event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final filtered = event.companyId == 'all'
          ? currentState.allOffers
          : currentState.allOffers.where((o) => o.companyId == event.companyId).toList();

      emit(ProductLoaded(
        allOffers: currentState.allOffers,
        filteredOffers: filtered,
        companies: currentState.companies,
        selectedCompanyId: event.companyId,
      ));
    }
  }
}
