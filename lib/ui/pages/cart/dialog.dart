part of 'page.dart';

class _Dialog extends StatelessWidget {
  const _Dialog();

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Hooray...!'),
        content: const Text('Your order has been successfuly sent, thank you.\n'
            'Please continue shopping back to home page'),
        actions: [
          FilledButton(
              onPressed: () {
                Navigator.pop(context);
                AutoRouter.of(context).pop();
              },
              child: const Text('Go to homepage'))
        ],
      );
}
