import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/styles.dart';
import 'package:store/data/model/product.dart';
import 'package:store/provider/product_provider.dart';
import 'package:store/ui/widgets/product_card.dart';
import 'package:store/utils/result_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const dashboardTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, state, child) {
        if (state.state == ResultState.loading) {
          return Center(child: CircularProgressIndicator(color: kPrimaryColor));
        } else if (state.state == ResultState.hasData) {
          return ProductList(products: state.result.products);
        } else {
          return Center(child: Text(state.message));
        }
      },
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        var product = products[index];
        return ProductCard(product: product);
      },
      itemCount: products.length,
    );
  }
}
