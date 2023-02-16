import 'package:auto_route/auto_route.dart';
import 'package:ellipsis_digital_commerce/constants.dart';
import 'package:ellipsis_digital_commerce/providers/shopping_cart/provider.dart';
import 'package:ellipsis_digital_commerce/repository/provider.dart';
import 'package:ellipsis_digital_commerce/ui/routes/routes.gr.dart';
import 'package:ellipsis_digital_commerce/ui/widgets/product_details/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:provider/provider.dart';

class AppSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () => query = '', icon: const Icon(Icons.clear_rounded))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_rounded));

  @override
  Widget buildResults(BuildContext context) =>
      query.isEmpty ? Container() : _Results(query: query);

  @override
  Widget buildSuggestions(BuildContext context) =>
      query.isEmpty ? Container() : _Results(query: query);
}

class _Results extends StatelessWidget {
  final String query;
  const _Results({required this.query});

  @override
  Widget build(BuildContext context) => riverpod.Consumer(
      builder: (context, ref, child) => ref.watch(productsProvider).when(
            data: (data) {
              final products = data
                  .where((element) =>
                      element.title.toLowerCase().contains(query.toLowerCase()))
                  .toList();
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: edgeInsertsValue,
                          vertical: edgeInsertsValue / 2),
                      onTap: () => showProductDetailsSheet(
                          context: context,
                          product: product,
                          onBuy: () {
                            Provider.of<ShoppingCartProvider>(context)
                                .addProduct(product);
                            AutoRouter.of(context)
                                .push(const ShoppingCartPageRoute());
                          }),
                      dense: true,
                      title: Text(product.title),
                    );
                  });
            },
            error: (error, _) => Text(error.toString()),
            loading: () => const LinearProgressIndicator(),
          ));
}
