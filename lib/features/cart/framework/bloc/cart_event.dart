import 'package:equatable/equatable.dart';
import 'package:my_store/features/product/app/model/product_model.dart';

sealed class CartEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class AddOrRemoveProductToCart extends CartEvent {

  final ProductModel cartProduct;

  AddOrRemoveProductToCart({required this.cartProduct});

  @override
  List<Object?> get props => [cartProduct];
}

final class GetProductsCart extends CartEvent {

  GetProductsCart();

  @override
  List<Object?> get props => [];
}

final class PurchaseCart extends CartEvent {

  PurchaseCart();

  @override
  List<Object?> get props => [];
}