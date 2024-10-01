import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_alura/design_system/alura_colors.dart';
import 'package:teste_alura/features/home/presentation/blocs/home_bloc.dart';
import 'package:teste_alura/features/home/presentation/widgets/category_card.dart';

class CategoriesList extends StatelessWidget {
  final HomeBloc homeBloc;
  const CategoriesList({super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AluraColors.mediumLightGray.withOpacity(0.35),
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Text(
            "Categorias",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "De roupas a gadgets tecnológicos temos tudo para atender suas paixões e hobbies com estilo e autenticidade.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AluraColors.lightBlue),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is CategoriesByNameSuccess) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.categoriesModel.length,
                    itemBuilder: (context, index) => CardCategory(
                          categoryModel: state.categoriesModel[index],
                          homeBloc: homeBloc,
                        ));
              }
              if (homeBloc.categoriesModel.isNotEmpty) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeBloc.categoriesModel.length,
                    itemBuilder: (context, index) => CardCategory(
                          categoryModel: homeBloc.categoriesModel[index],
                          homeBloc: homeBloc,
                        ));
              }
              if (state is HomeInProgress) {
                return const CircularProgressIndicator();
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
