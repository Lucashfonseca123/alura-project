import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_alura/core/utils/assets_paths.dart';

class ListSocialMedia extends StatelessWidget {
  const ListSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(AssetsPaths.iconWhatsapp),
          SvgPicture.asset(AssetsPaths.iconInstagram),
          SvgPicture.asset(AssetsPaths.iconTiktok),
        ],
      ),
    );
  }
}
