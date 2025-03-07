
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/framework/bloc/cart_bloc.dart';
import 'package:my_store/features/cart/framework/bloc/cart_event.dart';
import 'package:my_store/features/product/app/model/product_model.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    required this.product,
    super.key
    });


  final ProductModel product;
  @override
  Widget build(BuildContext context) {

    final cartProducts = context.watch<CartProductBloc>().state.cartProducts;

    ProductModel cartProduct = cartProducts.firstWhere( (element) => element.id == product.id, orElse: (){
      return ProductModel(
        id: product.id, 
        title: product.title, 
        rating: product.rating, 
        price: product.price, 
        imageUrl: product.imageUrl, 
        total: 0,
        quantity: 0
      );
    });
    

    
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: SizedBox(
        height: 36,
        child: Row(
          children: [
            cartProduct.quantity > 0 
            ? Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: ElevatedButton.icon(
                      onPressed: () => removeProductToCart(context, cartProduct),
                      icon: Icon(Icons.shopping_cart, color: const Color.fromARGB(255, 255, 255, 255),), 
                      label: Text(
                        "Remove", 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 250, 11, 11),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(8))
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                    SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () => substractProductToCart(context, cartProduct),
                        
                        icon: Icon(Icons.remove, color: Colors.black, size: 16,),
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 230, 230, 230),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero
                          ),
                        )
                      ),
                    ),
                    SizedBox(width: 28, child: Center(child: Text("${cartProduct.quantity}"))),
                    Flexible(
                      child: IconButton(
                        onPressed: () => addProductToCart(context, cartProduct),
                        
                        icon: Icon(Icons.add, color: Colors.black, size: 16,),
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 230, 230, 230),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(right: Radius.circular(8))
                          ),
                        )
                      ),
                    ),
                                  
                      ],
                    ),
                  )
                ],
              ),
            ) : ElevatedButton.icon(
    
              onPressed: () => addProductToCart(context, cartProduct),
              
              icon: Icon(Icons.shopping_cart, color: Colors.black,), 
              label: Text("Add to cart", style: TextStyle(
                color: Colors.black,
                
              ),),
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.from(alpha: 1, red: 0.98, green: 0.776, blue: 0.043),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              )
            ) 
          ],
        ),
      ),
    );
  }

  void addProductToCart(BuildContext context, ProductModel cartProduct) {
    cartProduct = cartProduct.copyWith(quantity: cartProduct.quantity + 1);
    BlocProvider.of<CartProductBloc>(context).add(AddOrRemoveProductToCart(cartProduct: (cartProduct)));
  }

  void substractProductToCart(BuildContext context, ProductModel cartProduct) {
    cartProduct = cartProduct.copyWith(quantity: cartProduct.quantity - 1);
    BlocProvider.of<CartProductBloc>(context).add(AddOrRemoveProductToCart(cartProduct: (cartProduct)));
  }

  void removeProductToCart(BuildContext context, ProductModel cartProduct) {
    cartProduct = cartProduct.copyWith(quantity: 0);
    BlocProvider.of<CartProductBloc>(context).add(AddOrRemoveProductToCart(cartProduct: (cartProduct)));
  }
}