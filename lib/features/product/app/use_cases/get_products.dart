import 'package:my_store/features/product/core/entities/product.dart';
import 'package:my_store/features/product/core/repository/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> getProducts() async {
    return await repository.getProducts();
  }
}