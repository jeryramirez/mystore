import 'package:my_store/features/product/app/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
}