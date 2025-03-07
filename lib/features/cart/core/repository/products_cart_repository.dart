
import 'package:my_store/features/product/app/model/product_model.dart';

abstract class ProductsCartRepository {
    Stream<List<ProductModel>> streamCartProducts();
    Future<void> addProductToCart(ProductModel product);
    Future<void> deleteProductToCart(String productId);
    Future<void> purchaseCart();
}