import 'package:flutter/material.dart';
import 'package:store/common/styles.dart';
import 'package:store/data/model/quote.dart';

class QuoteTile extends StatelessWidget {
  const QuoteTile({super.key, required this.quote});

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quote.author,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          Text(
            quote.quote,
            style: blackTextStyle.copyWith(
              fontWeight: regular,
              height: 2,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
