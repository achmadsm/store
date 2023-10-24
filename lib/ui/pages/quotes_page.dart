import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/styles.dart';
import 'package:store/data/model/quote.dart';
import 'package:store/provider/quote_provider.dart';
import 'package:store/ui/widgets/quote_tile.dart';
import 'package:store/utils/result_state.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  static const quotesTitle = 'Quotes';

  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, state, child) {
        if (state.state == ResultState.loading) {
          return Center(child: CircularProgressIndicator(color: kPrimaryColor));
        } else if (state.state == ResultState.hasData) {
          return QuoteList(quotes: state.result.quotes);
        } else {
          return Center(child: Text(state.message));
        }
      },
    );
  }
}

class QuoteList extends StatelessWidget {
  const QuoteList({super.key, required this.quotes});

  final List<Quote> quotes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      itemBuilder: (context, index) {
        var quote = quotes[index];
        return QuoteTile(quote: quote);
      },
      itemCount: quotes.length,
    );
  }
}
