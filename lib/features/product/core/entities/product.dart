
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final double rating;
  final double price;
  final String imageUrl;
  final int quantity;

  const Product({
    required this.id,
    required this.title, 
    required this.rating, 
    required this.price,
    required this.imageUrl,
    required this.quantity
  });
  
  double get totalPrice => (price * quantity);

  @override
  List<Object> get props => [id, title, rating, price, imageUrl, quantity];

  Product copyWith({
    String? id,
    String? title,
    double? rating,
    double? price,
    String? imageUrl,
    double? total,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }
}