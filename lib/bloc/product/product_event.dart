import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent {}

class FilterProductsByCompany extends ProductEvent {
  final String companyId;

  const FilterProductsByCompany(this.companyId);

  @override
  List<Object?> get props => [companyId];
}
