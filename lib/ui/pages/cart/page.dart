import 'package:auto_route/auto_route.dart';
import 'package:ellipsis_digital_commerce/constants.dart';
import 'package:ellipsis_digital_commerce/models/product/product.dart';
import 'package:ellipsis_digital_commerce/providers/shopping_cart/provider.dart';
import 'package:ellipsis_digital_commerce/ui/widgets/product_details/widget.dart';
import 'package:ellipsis_digital_commerce/ui/widgets/space_between.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
part 'floating_button.dart';
part 'dialog.dart';
part 'product_widget.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer<ShoppingCartProvider>(builder: (context, provider, child) {
      final products = provider.state.products;
      return Scaffold(
        floatingActionButton: const _FloatingButton(),
        appBar: AppBar(
          title: const Text('Your shopping cart'),
          actions: [
            IconButton(
                onPressed: () {
                  provider.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Shopping cart cleared')));
                  AutoRouter.of(context).pop();
                },
                icon: const Icon(Icons.clear_all_rounded))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) => _ProductWidget(
                      entry: products.entries.elementAt(index),
                      initiallyExpanded: index == 0)),
            ),
            // const SpaceBetween(),
            Card(
              margin: const EdgeInsets.all(edgeInsertsValue / 2),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(edgeInsertsValue / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Total products', style: textTheme.bodySmall),
                    Text(provider.state.totalProductNumber.toString(),
                        style: textTheme.headlineSmall),
                    const SpaceBetween(),
                    Text('Total amount', style: textTheme.bodySmall),
                    Text(provider.state.totalPrice.toString(),
                        style: textTheme.headlineLarge)
                  ],
                ),
              ),
            ),
            const SpaceBetween(times: 5)
          ],
        ),
      );
    });
  }
}
