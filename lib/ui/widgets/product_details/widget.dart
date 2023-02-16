import 'package:ellipsis_digital_commerce/constants.dart';
import 'package:ellipsis_digital_commerce/models/product/product.dart';
import 'package:ellipsis_digital_commerce/ui/widgets/image.dart';
import 'package:ellipsis_digital_commerce/ui/widgets/space_between.dart';
import 'package:flutter/material.dart';

void showProductDetailsSheet(
        {required BuildContext context,
        required Product product,
        required Function? onBuy}) =>
    Scaffold.of(context).showBottomSheet(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 1.5),
        enableDrag: true,
        (context) => _ProductDetailsSheet(product, onBuy));

class _ProductDetailsSheet extends StatelessWidget {
  final Product product;
  final Function? onBuy;
  const _ProductDetailsSheet(this.product, this.onBuy);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    final labelTextTheme =
        textTheme.labelMedium?.copyWith(color: themeData.colorScheme.primary);
    return Padding(
      padding: const EdgeInsets.all(edgeInsertsValue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpaceBetween(),
          Text(product.title, style: textTheme.titleLarge),
          const SpaceBetween(times: .5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.category, style: labelTextTheme),
              Text('${product.rate} rated', style: labelTextTheme),
            ],
          ),
          const SpaceBetween(),
          Expanded(child: ImageWidget(url: product.imageURL)),
          const SpaceBetween(),
          Text('Description', style: textTheme.titleMedium),
          Text(product.description),
          const SpaceBetween(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded),
                label: const Text('Close'),
              ),
              if (onBuy != null) ...[
                const SpaceBetween(),
                FilledButton.icon(
                  onPressed: () => onBuy!(),
                  icon: const Icon(Icons.shopping_cart_rounded),
                  label: Text('Buy | Price ${product.price}'),
                )
              ]
            ],
          )
        ],
      ),
    );
  }
}
