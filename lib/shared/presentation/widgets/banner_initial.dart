import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_alura/core/utils/assets_paths.dart';
import 'package:teste_alura/design_system/alura_colors.dart';
import 'package:teste_alura/features/home/presentation/blocs/home_bloc.dart';
import 'package:teste_alura/features/home/presentation/screens/products_screen.dart';

class BannerInitial extends StatelessWidget {
  final HomeBloc homeBloc;
  const BannerInitial({super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AluraColors.darkBlue,
      padding: const EdgeInsets.only(top: 24, bottom: 60),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              width: double.maxFinite,
              child: Image.asset(
                AssetsPaths.bannerHome,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AluraColors.pink),
                text: "Hora de abraçar seu ",
                children: <TextSpan>[
                  TextSpan(
                      text: "lado geek!",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AluraColors.green)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                          value: homeBloc,
                          child: const ProductScreen(
                            fromNews: true,
                          ),
                        )));
              },
              child: const Text("Ver as novidades!"))
        ],
      ),
    );
  }
}
