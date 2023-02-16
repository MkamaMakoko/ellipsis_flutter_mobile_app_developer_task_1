import 'package:auto_route/annotations.dart';
import 'package:ellipsis_digital_commerce/ui/pages/cart/page.dart';
import 'package:ellipsis_digital_commerce/ui/pages/home/page.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: ShoppingCartPage),
])
class $AppRouter {}
