part of 'page.dart';

class _Products extends riverpod.ConsumerWidget {
  const _Products();

  @override
  Widget build(BuildContext context, riverpod.WidgetRef ref) {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .4,
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3);
    void refresh() => ref.invalidate(productsProvider);
    final products = ref.watch(productsProvider);
    //
    return products.when(
        data: (data) => RefreshIndicator(
              onRefresh: () async => refresh(),
              child: Consumer<SortProductsProvider>(
                  builder: (context, provider, child) {
                final products =
                    sortProducts(products: data, state: provider.state);
                return GridView.builder(
                  gridDelegate: gridDelegate,
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      _ProductWidget(product: products[index]),
                );
              }),
            ),
        error: (error, _) => Padding(
              padding: const EdgeInsets.all(edgeInsertsValue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.error_rounded),
                      const SpaceBetween(),
                      Expanded(child: Text(error.toString())),
                    ],
                  ),
                  const SpaceBetween(),
                  ElevatedButton.icon(
                      onPressed: refresh,
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Retry'))
                ],
              ),
            ),
        loading: () => Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(edgeInsertsValue),
              child: const CircularProgressIndicator(),
            ));
  }
}
