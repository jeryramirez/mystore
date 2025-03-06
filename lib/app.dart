import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/framework/bloc/cart_bloc.dart';
import 'package:my_store/features/cart/framework/ui/screen/cart_screen.dart';
import 'package:my_store/features/cart/framework/ui/screen/purchase_screen.dart';
import 'package:my_store/features/product/app/data_source/product_data_source.dart';
import 'package:my_store/features/product/app/use_cases/get_products.dart';
import 'package:my_store/features/product/core/repository/product_repository.dart';
import 'package:my_store/features/product/framework/ui/screen/product_screen.dart';
import 'package:my_store/features/product/framework/bloc/product_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    final GetProducts getProducts = GetProducts(ProductDataSourceImp());

    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_) => ProductBloc(getProductsUseCase: getProducts)),
        BlocProvider(create: (_) => CartProductBloc()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductsScreen(),
        '/cart': (context) => CartScreen(),
        '/purchase': (context) => PurchaseScreen(),
      },
    ),
      );
  }
}