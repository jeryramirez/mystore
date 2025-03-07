
import 'package:my_store/features/cart/app/data_source/cart_service.dart';
import 'package:my_store/features/cart/core/repository/products_cart_repository.dart';
import 'package:my_store/features/product/app/model/product_model.dart';

class ProductsCartRepositoryImp implements ProductsCartRepository {

  final CartDataSourceRepository productDataSource;

  ProductsCartRepositoryImp(this.productDataSource);


  @override
  Stream<List<ProductModel>> streamCartProducts() {
    return productDataSource.streamCartProducts();
  }
  
  @override
  Future<void> addProductToCart(ProductModel product) async {
    return await productDataSource.addProductToCart(product);
  }

  @override
  Future<void> deleteProductToCart(String productId) async {
    return await productDataSource.deleteProductToCart(productId);
  }

  @override
  Future<void> purchaseCart() async {
    return await productDataSource.purchaseCart();
  }

}