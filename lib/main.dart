import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:teste_alura/build_config.dart';
import 'package:teste_alura/core/helpers/http_helper.dart';
import 'package:teste_alura/design_system/themes.dart';
import 'package:teste_alura/features/home/domain/repositories/home_repository.dart';
import 'package:teste_alura/features/home/presentation/blocs/home_bloc.dart';
import 'package:teste_alura/features/home/presentation/screens/home_screen.dart';

void main() {
  BuildConfig.prod();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HttpHelper _httpHelper = HttpHelperImpl(Client());

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Alura',
      theme: mainTheme,
      home: BlocProvider<HomeBloc>(
          lazy: false,
          create: (context) => HomeBloc(HomeRepository(_httpHelper)),
          child: const HomeScreen()),
    );
  }
}
