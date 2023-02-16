part of 'page.dart';

class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text('Randy Appuser'),
            accountEmail: Text('randy@jmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person_rounded),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(edgeInsertsValue),
            child: AboutListTile(
              dense: true,
            ),
          )
        ],
      ),
    );
  }
}
