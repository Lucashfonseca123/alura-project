part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class CategoriesRequested extends HomeEvent {
  CategoriesRequested();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsRequested extends HomeEvent {
  ProductsRequested();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsByCategoryRequested extends HomeEvent {
  final int categoryId;
  ProductsByCategoryRequested({required this.categoryId});

  @override
  // TODO: implement props
  List<Object?> get props => [categoryId];
}

class CategoryFilteredByNameRequested extends HomeEvent {
  final String name;
  CategoryFilteredByNameRequested({required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}

class ProductsByNameFiltered extends HomeEvent {
  final String productName;
  final bool productsFilteredByCategory;
  ProductsByNameFiltered(
      {required this.productName, required this.productsFilteredByCategory});

  @override
  // TODO: implement props
  List<Object?> get props => [productName, productsFilteredByCategory];
}
