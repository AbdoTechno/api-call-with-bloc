import 'package:api_call_bloc/home/controllers/cubit/products_cubit.dart';
import 'package:api_call_bloc/home/widgets/catalog_header.dart';
import 'package:api_call_bloc/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        switch (state) {
          case ProductsLoading():
            return const Center(child: CircularProgressIndicator());
          case ProductsLoaded():
            final products = state.products;

            return Column(
              children: [
                CatalogHeader(
                  title: 'DummyJSON Catalog',
                  count: products.length,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: products.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  ),
                ),
              ],
            );
          case ProductsError():
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                ),
              ),
            );
        }
      },
    );
  }
}
