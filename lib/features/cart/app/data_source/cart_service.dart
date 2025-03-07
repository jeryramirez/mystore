

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_store/features/product/app/model/product_model.dart';

abstract class CartDataSourceRepository {
  Stream<List<ProductModel>> streamCartProducts();
  Future<void> addProductToCart(ProductModel product);
  Future<void> deleteProductToCart(String productId);
  Future<void> purchaseCart();
}

class CartDataSourceImp implements CartDataSourceRepository{

  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _cartRef;

  CartDataSourceImp(){
    _cartRef = _firestore.collection('cart').withConverter<ProductModel>(
      fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!), 
      toFirestore: (product, _) => product.toJson()
    );
  }

  @override
  Stream<List<ProductModel>> streamCartProducts() {
    return _firestore
        .collection('cart')
        .snapshots()
        .map(
          (snapshot) =>
            snapshot.docs
              .map(
                (doc) => ProductModel.fromJson({...doc.data(), "id": doc.id}),
              )
              .toList(),
        );
  }

  @override
  Future<void> addProductToCart(ProductModel product) async {
    // _cartRef.add(product);

    return await _cartRef.doc(product.id).set(product);
  }

  @override
  Future<void> deleteProductToCart(productId) async {
    // _cartRef.add(product);

    return await _cartRef.doc(productId).delete();
  }

  @override 
  Future<void> purchaseCart() async {

    final cartProducts = await _firestore.collection("cart").get();
      for (var doc in cartProducts.docs) {
        return await doc.reference.delete();
      }
  }
}