import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String imageUrl;

  const CategoryModel(
      {required this.id, required this.name, required this.imageUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json["id"], name: json["nome"], imageUrl: json["imagem"]);
  }

  @override
  List<Object?> get props => [id, name, imageUrl];
}
