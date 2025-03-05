import 'package:equatable/equatable.dart';
import 'package:my_store/features/product/core/entities/product.dart';

sealed class CartEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class AddProductToCart extends CartEvent {

  final Product cartProduct;

  AddProductToCart({required this.cartProduct});

  @override
  List<Object?> get props => [cartProduct];
}

final class PurchaseCart extends CartEvent {

  PurchaseCart();

  @override
  List<Object?> get props => [];
}