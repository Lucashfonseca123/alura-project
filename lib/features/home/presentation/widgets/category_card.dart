import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_alura/design_system/alura_colors.dart';
import 'package:teste_alura/features/home/domain/models/category_model.dart';
import 'package:teste_alura/features/home/presentation/blocs/home_bloc.dart';
import 'package:teste_alura/features/home/presentation/screens/products_screen.dart';

class CardCategory extends StatefulWidget {
  final CategoryModel categoryModel;
  final HomeBloc homeBloc;

  const CardCategory(
      {super.key, required this.categoryModel, required this.homeBloc});

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = widget.homeBloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 12),
      child: InkWell(
        onTap: () {
          BlocProvider.of<HomeBloc>(context).add(
              ProductsByCategoryRequested(categoryId: widget.categoryModel.id));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                    value: homeBloc,
                    child: const ProductScreen(),
                  )));
        },
        child: Container(
          color: AluraColors.white,
          child: Column(
            children: [
              Image.network(
                widget.categoryModel.imageUrl,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                widget.categoryModel.name,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
