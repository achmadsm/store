class ProductResult {
  final List<Product> products;

  ProductResult({
    required this.products,
  });

  factory ProductResult.fromJson(Map<String, dynamic> json) => ProductResult(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int id;
  final String title;
  final int price;
  final double rating;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        rating: json["rating"]?.toDouble(),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "rating": rating,
        "thumbnail": thumbnail,
      };
}
