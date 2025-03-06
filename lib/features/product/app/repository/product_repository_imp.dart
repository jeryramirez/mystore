import 'package:my_store/features/product/app/data_source/product_data_source.dart';
import 'package:my_store/features/product/core/entities/product.dart';
import 'package:my_store/features/product/core/repository/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImp({
    required this.productDataSource
  });

  @override
  Future<List<Product>> getProducts() async {
    return await productDataSource.getProducts();
  }
}