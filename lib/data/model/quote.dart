class QuoteResult {
  final List<Quote> quotes;

  QuoteResult({
    required this.quotes,
  });

  factory QuoteResult.fromJson(Map<String, dynamic> json) => QuoteResult(
        quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quotes": List<dynamic>.from(quotes.map((x) => x.toJson())),
      };
}

class Quote {
  final int id;
  final String quote;
  final String author;

  Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json["id"],
        quote: json["quote"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "author": author,
      };
}
