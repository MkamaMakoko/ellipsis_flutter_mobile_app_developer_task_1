import 'package:ellipsis_digital_commerce/constants.dart';
import 'package:ellipsis_digital_commerce/providers/shopping_cart/provider.dart';
import 'package:ellipsis_digital_commerce/providers/sort_products/provider.dart';
import 'package:ellipsis_digital_commerce/ui/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:provider/provider.dart';

void main() => runApp(const riverpod.ProviderScope(child: MyApp()));

final _router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const useMaterial3 = true;
    const scheme = FlexScheme.amber;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCartProvider()),
        ChangeNotifierProvider(create: (context) => SortProductsProvider()),
      ],
      child: MaterialApp.router(
        title: appTitle,
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
        theme: FlexThemeData.light(useMaterial3: useMaterial3, scheme: scheme),
        darkTheme:
            FlexThemeData.dark(useMaterial3: useMaterial3, scheme: scheme),
      ),
    );
  }
}
