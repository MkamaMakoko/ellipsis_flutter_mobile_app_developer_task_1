part of 'page.dart';

class _ProductWidget extends StatelessWidget {
  final Product product;

  const _ProductWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    final cartprovider = Provider.of<ShoppingCartProvider>(context);
    return InkWell(
      onTap: () => showProductDetailsSheet(
          context: context,
          product: product,
          onBuy: () {
            cartprovider.addProduct(product);
            AutoRouter.of(context).push(const ShoppingCartPageRoute());
          }),
      child: Card(
        margin: const EdgeInsets.all(edgeInsertsValue / 2),
        child: Padding(
          padding: const EdgeInsets.all(edgeInsertsValue / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(product.title, style: textTheme.bodyLarge),
              const SpaceBetween(),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: ImageWidget(url: product.imageURL))),
              const SpaceBetween(),
              Text('${product.rate} rated',
                  style: textTheme.labelSmall
                      ?.copyWith(color: themeData.colorScheme.primary)),
              const SpaceBetween(times: .5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Price', style: textTheme.bodySmall),
                      Text(product.price.toString(),
                          style: textTheme.bodyLarge),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        cartprovider.addProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Product added successfully'),
                            action: SnackBarAction(
                                label: 'Go to cart',
                                onPressed: () => AutoRouter.of(context)
                                    .push(const ShoppingCartPageRoute()))));
                      },
                      icon: const Icon(Icons.add_shopping_cart_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
