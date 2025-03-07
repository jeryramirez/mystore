
class ProductModel {
    final String id;
    final String title;
    final double rating;
    final double price;
    final String imageUrl;
    final double total;
    final int quantity;

  const ProductModel({
    required this.id,
    required this.title, 
    required this.rating, 
    required this.price,
    required this.imageUrl,
    required this.total,
    required this.quantity,
  });
  
  double get totalPrice => (price * quantity);

  ProductModel copyWith({
    String? id,
    String? title,
    double? rating,
    double? price,
    String? imageUrl,
    double? total,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      total: total ?? this.total,
      quantity: quantity ?? this.quantity,
    );
  }
 
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["meta"]["barcode"],
        title: json["title"],
        rating: json["rating"],
        price: json["price"],
        imageUrl: json["thumbnail"],
        total: json["total"] ?? 0,
        quantity: json["quantity"] ?? 0 
      );
    }

  Map<String, dynamic> toJson() {
    return {
      "meta": {
        "barcode": id,
      },
      "title": title,
      "rating": rating,
      "price": price,
      "thumbnail": imageUrl,
      "quantity": quantity,
    };
  }
}