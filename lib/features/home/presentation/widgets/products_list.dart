import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_alura/design_system/alura_colors.dart';
import 'package:teste_alura/features/home/presentation/blocs/home_bloc.dart';
import 'package:teste_alura/features/home/presentation/widgets/product_card.dart';

class ProductsList extends StatefulWidget {
  final bool? fromNews;
  const ProductsList({super.key, this.fromNews = false});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AluraColors.darkBlue, //change your color here
        ),
        title: Text(
          "Produtos",
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (String text) {
                BlocProvider.of<HomeBloc>(context).add(ProductsByNameFiltered(
                    productName: text.toLowerCase(),
                    productsFilteredByCategory: widget.fromNews ?? false));
              },
              decoration: InputDecoration(
                hintText: "Pesquise seu produto",
                hintStyle: Theme.of(context)
                    .inputDecorationTheme
                    .hintStyle!
                    .copyWith(fontSize: 13),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                suffixIconConstraints:
                    const BoxConstraints(minWidth: 50, maxHeight: 80),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is ProductsByNameSuccess) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.productsModel.length,
                      itemBuilder: (context, index) => ProductCard(
                          productModel: state.productsModel[index]));
                }

                if (state is ProductsByCategoryIdSuccess) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.productsModel.length,
                      itemBuilder: (context, index) => ProductCard(
                          productModel: state.productsModel[index]));
                }
                if (widget.fromNews ?? false) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: BlocProvider.of<HomeBloc>(context)
                          .productsModel
                          .length,
                      itemBuilder: (context, index) => ProductCard(
                          productModel: BlocProvider.of<HomeBloc>(context)
                              .productsModel[index]));
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
