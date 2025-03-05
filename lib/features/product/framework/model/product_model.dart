import 'package:my_store/features/product/core/entities/product.dart';

class ProductModel extends Product {

  const ProductModel({
    required super.id,
    required super.title, 
    required super.rating, 
    required super.price,
    required super.imageUrl,
    required super.quantity,
  });
 
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["meta"]["barcode"],
        title: json["title"],
        rating: json["rating"],
        price: json["price"],
        imageUrl: json["thumbnail"],
        quantity: 0
      );
    }
}