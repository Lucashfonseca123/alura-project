part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeInProgress extends HomeState {
  HomeInProgress();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoriesSuccess extends HomeState {
  final List<CategoryModel> categoryModel;
  final List<ProductModel> productsModel;

  CategoriesSuccess({required this.categoryModel, required this.productsModel});

  @override
  // TODO: implement props
  List<Object?> get props => [categoryModel, productsModel];
}

class ProductsByCategoryIdSuccess extends HomeState {
  final List<ProductModel> productsModel;

  ProductsByCategoryIdSuccess({required this.productsModel});

  @override
  // TODO: implement props
  List<Object?> get props => [productsModel];
}

class CategoriesByNameSuccess extends HomeState {
  final List<CategoryModel> categoriesModel;

  CategoriesByNameSuccess({required this.categoriesModel});

  @override
  // TODO: implement props
  List<Object?> get props => [categoriesModel];
}

class ProductsByNameSuccess extends HomeState {
  final List<ProductModel> productsModel;

  ProductsByNameSuccess({required this.productsModel});

  @override
  // TODO: implement props
  List<Object?> get props => [productsModel];
}

class CategoriesFailure extends HomeState {
  CategoriesFailure();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsFailure extends HomeState {
  ProductsFailure();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
