part of 'page.dart';

class _SortWidget extends StatelessWidget {
  const _SortWidget();

  @override
  Widget build(BuildContext context) => Consumer<SortProductsProvider>(
      builder: (context, provider, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: edgeInsertsValue),
            child: Wrap(
              spacing: edgeInsertsValue,
              children: [
                for (final item in SortProductState.values)
                  ChoiceChip(
                    label: Text('Sort by ${item.name}'),
                    selected: item == provider.state,
                    onSelected: (_) => provider.changeSort(item),
                  )
              ],
            ),
          ));
}
