import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_alura/design_system/alura_colors.dart';
import 'package:teste_alura/features/home/presentation/blocs/home_bloc.dart';
import 'package:teste_alura/features/home/presentation/screens/products_screen.dart';

class SeeMore extends StatelessWidget {
  final HomeBloc homeBloc;
  const SeeMore({super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: AluraColors.mediumLightGray.withOpacity(0.35),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 32, top: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                    value: homeBloc,
                    child: const ProductScreen(
                      fromNews: true,
                    ),
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Ver mais",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                decoration: TextDecoration.underline,
                color: AluraColors.purple),
          ),
        ),
      ),
    );
  }
}
