import 'package:equatable/equatable.dart';
import 'package:my_store/features/product/core/entities/product.dart';

final class CartState extends Equatable {
  const CartState({
    this.cartProducts = const [],
    this.cartProductsLoading = false,
  });

  final List<Product> cartProducts;
  final bool cartProductsLoading;


  @override
  List<Object?> get props => [cartProducts];

  CartState copyWith({
    List<Product>? cartProducts,
    bool? cartProductsLoading,

  }) {
    return CartState(
      cartProducts: cartProducts ?? this.cartProducts,
      cartProductsLoading: cartProductsLoading ?? this.cartProductsLoading,

    );
  }
}
