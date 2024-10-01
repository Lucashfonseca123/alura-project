import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_alura/core/utils/assets_paths.dart';
import 'package:teste_alura/design_system/alura_colors.dart';
import 'package:teste_alura/shared/presentation/widgets/alura_alert.dart';

class HeaderPreferred extends StatelessWidget implements PreferredSizeWidget {
  const HeaderPreferred({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AluraColors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            AluraAlert.showSuccess(context, message: "Menu");
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: SvgPicture.asset(
              AssetsPaths.menu,
            ),
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: SvgPicture.asset(
            AssetsPaths.primaryLogo,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              AluraAlert.showSuccess(context, message: "Perfil");
            },
            child: SvgPicture.asset(
              AssetsPaths.profile,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          InkWell(
            onTap: () {
              AluraAlert.showSuccess(context, message: "Carrinho");
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: SvgPicture.asset(
                AssetsPaths.shoppingCart,
              ),
            ),
          ),
        ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
