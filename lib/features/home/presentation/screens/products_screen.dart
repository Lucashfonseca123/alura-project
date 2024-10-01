import 'package:flutter/material.dart';
import 'package:teste_alura/features/home/presentation/widgets/products_list.dart';

class ProductScreen extends StatelessWidget {
  final bool? fromNews;
  const ProductScreen({super.key, this.fromNews});

  @override
  Widget build(BuildContext context) {
    return ProductsList(
      fromNews: fromNews,
    );
  }
}
