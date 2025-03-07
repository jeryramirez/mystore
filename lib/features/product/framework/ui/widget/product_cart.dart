
import 'package:flutter/material.dart';
import 'package:my_store/features/product/app/model/product_model.dart';
import 'package:my_store/features/product/framework/ui/widget/card_button.dart';
import 'package:my_store/features/product/framework/ui/widget/card_title.dart';
import 'package:my_store/features/product/framework/ui/widget/card_price.dart';
import 'package:my_store/features/product/framework/ui/widget/card_rating.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mainContainerWidth = screenWidth * 0.95;
    return GestureDetector(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            width: mainContainerWidth,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: const Color.fromARGB(255, 232, 232, 232)
                )
              )
            ),
            child: Row(
              children: [
                SizedBox(
                  width: mainContainerWidth * 0.35,
                  child: Column(
                    children: [
                      Image.network(
                        product.imageUrl,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mainContainerWidth * 0.65,
                  
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                    
                      children:[
                        CardTitle(title: product.title,),
                        CardRating(rate: product.rating),
                        CardPrice(price: product.price),
                        CartButton(product: product)
                      ]
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
