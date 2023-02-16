part of 'page.dart';

class _ProductWidget extends StatelessWidget {
  final MapEntry<Product, int> entry;
  final bool initiallyExpanded;
  const _ProductWidget({required this.entry, required this.initiallyExpanded});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final product = entry.key;
    final count = entry.value;
    const overflow = TextOverflow.ellipsis;
    return Consumer<ShoppingCartProvider>(builder: (context, provider, child) {
      return ExpansionTile(
        tilePadding: const EdgeInsets.all(edgeInsertsValue),
        initiallyExpanded: initiallyExpanded,
        childrenPadding: const EdgeInsets.all(edgeInsertsValue),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Text(product.title, maxLines: 2, overflow: overflow),
        subtitle: Text('$count added in cart | ${product.price} per item',
            maxLines: 3, overflow: overflow),
        children: [
          Text('Category: ${product.category}', style: textTheme.labelSmall),
          const SpaceBetween(times: .5),
          Text('Description', style: textTheme.titleMedium),
          Text(product.description),
          const SpaceBetween(),
          OutlinedButton.icon(
              onPressed: () => showProductDetailsSheet(
                  context: context, product: product, onBuy: null),
              icon: const Icon(Icons.info_rounded),
              label: const Text('More details')),
          // const SpaceBetween(),
          Row(
            children: [
              FilledButton.icon(
                  onPressed: () =>
                      provider.changeNumberOfProductCount(product: product),
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Add')),
              const SpaceBetween(),
              FilledButton.tonalIcon(
                  onPressed: () {
                    if (count > 1) {
                      provider.changeNumberOfProductCount(
                          product: product, increment: false);
                    } else {
                      provider.removeProduct(product.id);
                    }
                  },
                  icon: const Icon(Icons.remove_rounded),
                  label: const Text('Remove')),
            ],
          )
        ],
      );
    });
  }
}
