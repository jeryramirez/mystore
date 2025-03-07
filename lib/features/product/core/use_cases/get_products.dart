import 'package:my_store/features/product/app/model/product_model.dart';
import 'package:my_store/features/product/core/repository/product_repository.dart';

class GetProducts implements ProductRepository {
  final ProductRepository repository;

  GetProducts(this.repository);

  @override
  Future<List<ProductModel>> getProducts() async {
    return await repository.getProducts();
  }
}