import 'package:auto_route/auto_route.dart';
import 'package:ellipsis_digital_commerce/constants.dart';
import 'package:ellipsis_digital_commerce/models/product/product.dart';
import 'package:ellipsis_digital_commerce/providers/shopping_cart/provider.dart';
import 'package:ellipsis_digital_commerce/providers/sort_products/provider.dart';
import 'package:ellipsis_digital_commerce/repository/provider.dart';
import 'package:ellipsis_digital_commerce/ui/pages/search_delegate/delegate.dart';
import 'package:ellipsis_digital_commerce/ui/routes/routes.gr.dart';
import 'package:ellipsis_digital_commerce/utils/sort_products.dart';
import 'package:ellipsis_digital_commerce/ui/widgets/image.dart';
import 'package:ellipsis_digital_commerce/ui/widgets/product_details/widget.dart';
import 'package:ellipsis_digital_commerce/ui/widgets/space_between.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:provider/provider.dart';
part 'app_bar.dart';
part 'drawer.dart';
part 'floating_button.dart';
part 'products_widget.dart';
part 'product_widget.dart';
part 'sort_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: _Drawer(),
      floatingActionButton: _FloatingButton(),
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            _SortWidget(),
            _Products(),
          ])),
        ],
      ),
    );
  }
}
