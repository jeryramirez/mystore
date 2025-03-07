import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/core/repository/products_cart_repository.dart';
import 'package:my_store/features/cart/framework/bloc/cart_event.dart';
import 'package:my_store/features/cart/framework/bloc/cart_state.dart';

class CartProductBloc extends Bloc<CartEvent, CartState> {
  CartProductBloc(this._cartRepository) : super(const CartState()) {
    on<GetProductsCart>(_onGetProductsCart);
    on<AddOrRemoveProductToCart>(addOrRemoveProductToCart);
    on<PurchaseCart>(purchaseCart);
  }

  final ProductsCartRepository _cartRepository;


  void purchaseCart(
    PurchaseCart event,
    Emitter<CartState> emit,
  ){

    _cartRepository.purchaseCart();
    emit(
      state.copyWith(
        cartProducts: [],
      )
    );
  } 

  Future<void> _onGetProductsCart(GetProductsCart event, Emitter<CartState> emit){
    return emit.onEach(
      _cartRepository.streamCartProducts(),
      onData: (productsCart) {
        emit(
          state.copyWith(
            cartProducts: productsCart,
          ),
        );
      },
      onError: addError,
    );
  }

  Future<void> addOrRemoveProductToCart(
      AddOrRemoveProductToCart event,
      Emitter<CartState> emit,
    ) async {
      emit(state.copyWith(cartProductsLoading: true));

      final product = state.cartProducts.firstWhereOrNull( (element) => element.id == event.cartProduct.id);

      if(product != null){
      
        final productsCopy = [...state.cartProducts];
        final index = productsCopy.indexWhere((element) => element.id == product.id);

        if(event.cartProduct.quantity > 0){

          productsCopy[index] = event.cartProduct;
          _cartRepository.addProductToCart(event.cartProduct);
          emit(
            state.copyWith( 
              cartProducts: productsCopy,
              cartProductsLoading: false,
            ),
          );
        } else{
          _cartRepository.deleteProductToCart(event.cartProduct.id);
          productsCopy.removeAt(index);
        }

      } else{

        _cartRepository.addProductToCart(event.cartProduct);
        emit(
          state.copyWith(
            cartProducts: [...state.cartProducts, event.cartProduct],
          )
        );
      }
  }
}