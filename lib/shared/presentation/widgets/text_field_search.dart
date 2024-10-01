import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_alura/core/utils/assets_paths.dart';
import 'package:teste_alura/features/home/presentation/blocs/home_bloc.dart';

class TextFieldSearch extends StatefulWidget {
  final HomeBloc homeBloc;
  final Function(String text) onChanged;
  const TextFieldSearch(
      {super.key, required this.homeBloc, required this.onChanged});

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  void _onChanged(String text) {
    widget.onChanged(text);
    widget.homeBloc
        .add(CategoryFilteredByNameRequested(name: text.toLowerCase()));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: _onChanged,
      decoration: InputDecoration(
        hintText: "O que você procura?",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        suffixIconConstraints:
            const BoxConstraints(minWidth: 50, maxHeight: 80),
        suffixIcon: SizedBox(
          child: SvgPicture.asset(AssetsPaths.search),
        ),
      ),
    );
  }
}
