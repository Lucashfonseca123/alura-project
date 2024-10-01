import 'dart:developer';
import 'package:teste_alura/build_config.dart';
import 'package:teste_alura/core/exceptions/repository_exceptions.dart';
import 'package:teste_alura/core/helpers/http_helper.dart';
import 'package:teste_alura/features/home/domain/models/category_model.dart';
import 'package:teste_alura/features/home/domain/models/product_model.dart';

class HomeRepository {
  final HttpHelper _httpHelper;

  HomeRepository._(this._httpHelper);
  static HomeRepository? _instance;

  factory HomeRepository(HttpHelper? httpHelper) {
    _instance ??= HomeRepository._(httpHelper!);
    return _instance!;
  }

  Future<List<CategoryModel>> requestCategories() async {
    return repositoryExceptionHandlerScope<List<CategoryModel>>(
      () async {
        final result = await _httpHelper.request(
            type: TypeRequest.get,
            url:
                '${BuildConfig.instance.serviceUrl}/68bc50d055acb4ecc7356180131df477/raw/14369c7e25fca54941f5359299b3f4f118a573d6/usedev-categorias.json');

        return convertListCategories(result);
      },
    );
  }

  Future<List<ProductModel>> requestProducts() async {
    return repositoryExceptionHandlerScope<List<ProductModel>>(
      () async {
        final result = await _httpHelper.request(
            type: TypeRequest.get,
            url:
                '${BuildConfig.instance.serviceUrl}/946cbbc91d0bc0e167eb6fd895a6b12a/raw/0f6661903360535587ebe583b959e84192cdb771/usedev-produtos.json');

        return convertListProducts(result);
      },
    );
  }

  convertListCategories(Map<String, dynamic> json) {
    return json["categorias"]
        .map<CategoryModel>((e) => CategoryModel.fromJson(e))
        .toList();
  }

  convertListProducts(Map<String, dynamic> json) {
    return json["produtos"]
        .map<ProductModel>((e) => ProductModel.fromJson(e))
        .toList();
  }
}
