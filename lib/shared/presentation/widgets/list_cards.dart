import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_alura/core/utils/assets_paths.dart';

class ListCards extends StatelessWidget {
  const ListCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(AssetsPaths.iconVisa),
          SvgPicture.asset(AssetsPaths.iconMasterCard),
          SvgPicture.asset(AssetsPaths.iconElo),
          SvgPicture.asset(AssetsPaths.iconDiners),
          SvgPicture.asset(AssetsPaths.iconPix),
        ],
      ),
    );
  }
}
