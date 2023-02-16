part of 'page.dart';

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartProvider>(
        child: const Icon(Icons.shopping_cart_rounded),
        builder: (context, provider, child) {
          final count = provider.state.totalProductNumber;
          return FloatingActionButton.extended(
            onPressed: () {
              if (count == 0) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text('Please add at least one product to continue')));
              } else {
                AutoRouter.of(context).push(const ShoppingCartPageRoute());
              }
            },
            label: Text(count.toString()),
            icon: child,
          );
        });
  }
}
