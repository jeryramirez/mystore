import 'package:my_store/features/product/app/data_source/product_data_source.dart';
import 'package:my_store/features/product/app/model/product_model.dart';

import 'package:my_store/features/product/core/repository/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  
  final ProductDataSource productDataSource;

  ProductRepositoryImp(this.productDataSource);

  @override
  Future<List<ProductModel>> getProducts() async {
    return await productDataSource.getProducts();
  }
}