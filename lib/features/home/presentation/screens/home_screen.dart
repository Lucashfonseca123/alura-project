import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_alura/features/home/presentation/blocs/home_bloc.dart';
import 'package:teste_alura/features/home/presentation/widgets/categories_list.dart';
import 'package:teste_alura/shared/presentation/widgets/banner_initial.dart';
import 'package:teste_alura/shared/presentation/widgets/footer.dart';
import 'package:teste_alura/shared/presentation/widgets/header_preferred.dart';
import 'package:teste_alura/shared/presentation/widgets/see_more.dart';
import 'package:teste_alura/shared/presentation/widgets/subscription_section.dart';
import 'package:teste_alura/shared/presentation/widgets/text_field_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  var listCategoriesKey = GlobalKey();

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(CategoriesRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderPreferred(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: TextFieldSearch(
                  onChanged: (String text) {
                    if (text.isNotEmpty) {
                      Scrollable.ensureVisible(
                        listCategoriesKey.currentContext!,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  homeBloc: BlocProvider.of<HomeBloc>(context)),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    BannerInitial(
                      homeBloc: BlocProvider.of<HomeBloc>(context),
                    ),
                    CategoriesList(
                      key: listCategoriesKey,
                      homeBloc: BlocProvider.of<HomeBloc>(context),
                    ),
                    SeeMore(
                      homeBloc: BlocProvider.of<HomeBloc>(context),
                    ),
                    const SubscriptionSection(),
                    const Footer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
