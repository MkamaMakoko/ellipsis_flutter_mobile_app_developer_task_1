part of 'page.dart';

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      title: const Text(appTitle),
      actions: [
        IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: AppSearchDelegate()),
            icon: const Icon(Icons.search_rounded))
      ],
    );
  }
}
