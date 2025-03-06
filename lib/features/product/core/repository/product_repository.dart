import 'package:my_store/features/product/core/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}