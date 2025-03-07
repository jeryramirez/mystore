import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_store/features/product/app/model/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductDataSourceImp implements ProductDataSource {

  @override
  Future<List<ProductModel>> getProducts() async {
    return await _getProductsFromUrl('https://dummyjson.com/products');
  }

  Future<List<ProductModel>> _getProductsFromUrl(String url) async {

    final response = await http.get( Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> productsJson = jsonResponse['products'];
      return productsJson.map((productJson) => ProductModel.fromJson(productJson)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}