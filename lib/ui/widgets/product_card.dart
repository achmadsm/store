import 'package:flutter/material.dart';
import 'package:store/common/styles.dart';
import 'package:store/data/model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 116,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(product.thumbnail),
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: Alignment.topRight,
            child: Container(
              width: 54.5,
              height: 30,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_outlined,
                    color: Colors.amber,
                  ),
                  Text(
                    product.rating.toStringAsFixed(1),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            product.title,
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 5),
          Text(
            '\$${product.price}',
            style: greyTextStyle.copyWith(
              fontWeight: light,
            ),
          ),
        ],
      ),
    );
  }
}
