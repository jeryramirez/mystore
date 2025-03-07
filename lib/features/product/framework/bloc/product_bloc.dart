import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/product/core/use_cases/get_products.dart';

import 'package:my_store/features/product/framework/bloc/product_event.dart';
import 'package:my_store/features/product/framework/bloc/product_state.dart';



class ProductBloc extends Bloc<GetProductsEvent, ProductState> {

  final GetProducts getProducts;

  ProductBloc({
    required GetProducts getProductsUseCase
  }) :  getProducts = getProductsUseCase, 
        super(const ProductState()) {
          on<GetProductsEvent>(getProductsEvent);
        }

  Future<void> getProductsEvent(
      GetProductsEvent event,
      Emitter<ProductState> emit,
    ) async {
      emit(state.copyWith(productsLoading: true));
      
      final futureProducts = await getProducts.getProducts();

      emit(
        state.copyWith(
          products: futureProducts,
          productsLoading: false,
        ),
      );
  }
}