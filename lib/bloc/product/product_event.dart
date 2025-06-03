abstract class ProductEvent {}

class LoadProducts extends ProductEvent {}

class FilterProducts extends ProductEvent {
  final String query; // companyId as string, "0" = All

  FilterProducts(this.query);
}
