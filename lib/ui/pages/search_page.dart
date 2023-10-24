import 'package:store/common/styles.dart';
import 'package:store/data/model/product.dart';
import 'package:store/provider/search_provider.dart';
import 'package:store/ui/widgets/custom_text_form_field.dart';
import 'package:store/ui/widgets/product_tile.dart';
import 'package:store/utils/result_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  static const searchTitle = 'Search';

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Search',
            controller: searchController,
            suffixIcon: Icon(Icons.search_rounded, color: kPrimaryColor),
            onChanged: (query) {
              Provider.of<SearchProvider>(context, listen: false)
                  .fetchSearch(query);
            },
          ),
          Consumer<SearchProvider>(
            builder: (context, state, child) {
              if (state.state == ResultState.loading) {
                return Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                );
              } else if (state.state == ResultState.hasData) {
                return ProductList(products: state.result.products);
              } else if (state.state == ResultState.noData) {
                return Center(child: Text(state.message));
              } else {
                return Center(child: Text(state.message));
              }
            },
          ),
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var product = products[index];
        return ProductTile(product: product);
      },
      itemCount: products.length,
    );
  }
}
