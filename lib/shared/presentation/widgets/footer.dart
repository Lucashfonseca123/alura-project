import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_alura/core/utils/assets_paths.dart';
import 'package:teste_alura/design_system/alura_colors.dart';
import 'package:teste_alura/shared/presentation/widgets/list_cards.dart';
import 'package:teste_alura/shared/presentation/widgets/list_social_media.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: AluraColors.darkBlue,
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          SvgPicture.asset(AssetsPaths.primaryGreenLogo),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Hora de abraçar seu lado geek!",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: AluraColors.green),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75),
            child: Container(
              width: double.maxFinite,
              height: 1.5,
              color: AluraColors.green,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Funcionamento",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AluraColors.white),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                key: const Key("date"),
                "Segunda a Sexta - 8h às 18h \nsac@usedev.com.br \n0800 541 320",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AluraColors.white),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
          Text(
            "Formas de Pagamento",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AluraColors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          const ListCards(),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Siga nossas redes: ",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AluraColors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          const ListSocialMedia()
        ],
      ),
    );
  }
}
