import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:teste_alura/core/exceptions/repository_exceptions.dart';
import 'package:teste_alura/features/home/domain/models/category_model.dart';
import 'package:teste_alura/features/home/domain/models/product_model.dart';
import 'package:teste_alura/features/home/domain/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  List<ProductModel> _productsModel = [];
  List<CategoryModel> _categoriesModel = [];
  List<ProductModel> _productsModelByCategoryId = [];
  List<CategoryModel> _categoriesByName = [];

  List<CategoryModel> get categoriesModel => _categoriesModel;
  List<ProductModel> get productsModel => _productsModel;

  HomeBloc(this._homeRepository) : super(HomeInitial()) {
    on<CategoriesRequested>((event, emit) async {
      try {
        emit(HomeInProgress());
        _categoriesModel = await _homeRepository.requestCategories();

        _productsModel = await _homeRepository.requestProducts();

        emit(CategoriesSuccess(
            categoryModel: _categoriesModel, productsModel: _productsModel));
      } on RequestFailure catch (e) {
        log(e.message!);
        emit(CategoriesFailure());
      }
    });

    on<CategoryFilteredByNameRequested>((event, emit) async {
      try {
        emit(HomeInProgress());

        _categoriesByName = _categoriesModel
            .where((element) => element.name.contains(event.name))
            .toList();

        emit(CategoriesByNameSuccess(categoriesModel: _categoriesByName));
      } on RequestFailure catch (e) {
        log(e.message!);
        emit(CategoriesFailure());
      }
    });

    on<ProductsByCategoryRequested>((event, emit) async {
      try {
        emit(HomeInProgress());

        _productsModelByCategoryId = _productsModel
            .where((element) => element.categoryId == event.categoryId)
            .toList();

        emit(ProductsByCategoryIdSuccess(
            productsModel: _productsModelByCategoryId));
      } on RequestFailure catch (e) {
        log(e.message!);
        emit(CategoriesFailure());
      }
    });

    on<ProductsByNameFiltered>((event, emit) async {
      try {
        emit(HomeInProgress());

        List<ProductModel> productsModelByName =
            (event.productsFilteredByCategory
                    ? _productsModel
                    : _productsModelByCategoryId)
                .where((element) =>
                    element.name.toLowerCase().contains(event.productName))
                .toList();

        emit(ProductsByNameSuccess(productsModel: productsModelByName));
      } on RequestFailure catch (e) {
        log(e.message!);
        emit(CategoriesFailure());
      }
    });
  }
}
