part of 'page.dart';

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ShoppingCartProvider>(context);
    return FloatingActionButton.extended(
      onPressed: () {
        cartProvider.checkOut();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const _Dialog());
      },
      label: const Text('Check out'),
      icon: const Icon(Icons.shopping_cart_checkout_rounded),
    );
  }
}
