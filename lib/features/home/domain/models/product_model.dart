import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final int categoryId;
  final String name;
  final double price;
  final String imageUrl;

  const ProductModel(
      {required this.id,
      required this.categoryId,
      required this.name,
      required this.price,
      required this.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"],
        categoryId: json["categoriaId"],
        name: json["nome"],
        price: json["preço"],
        imageUrl: json["imagem"]);
  }

  @override
  List<Object?> get props => [id, categoryId, name, price, imageUrl];
}
