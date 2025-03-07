
import 'package:my_store/features/cart/core/repository/products_cart_repository.dart';
import 'package:my_store/features/product/app/model/product_model.dart';

class GetProductsCart implements ProductsCartRepository {

  final ProductsCartRepository repository;

  GetProductsCart(this.repository);

  @override
  Stream<List<ProductModel>> streamCartProducts() {
    return repository.streamCartProducts();
  }

  @override
  Future<void> addProductToCart(ProductModel product) async {
    return await repository.addProductToCart(product);
  }

  @override
  Future<void> deleteProductToCart(String productId) async {
    return await repository.deleteProductToCart(productId);
  }

  @override
  Future<void> purchaseCart() async {
    return await repository.purchaseCart();
  }

}