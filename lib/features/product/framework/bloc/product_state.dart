import 'package:equatable/equatable.dart';
import 'package:my_store/features/product/core/entities/product.dart';

final class ProductState extends Equatable {
  const ProductState({
    this.products = const [],
    this.productsLoading = false,
  });

  final List<Product> products;
  final bool productsLoading;


  @override
  List<Object?> get props => [products];

  ProductState copyWith({
    List<Product>? products,
    bool? productsLoading,

  }) {
    return ProductState(
      products: products ?? this.products,
      productsLoading: productsLoading ?? this.productsLoading,

    );
  }
}
