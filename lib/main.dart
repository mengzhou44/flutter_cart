import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'catalog.dart';
import 'models/cart-model.dart';
import 'models/catalog-model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CatalogModel>(builder: (context) => CatalogModel()),
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProvider<CartModel>(
          builder: (context) => CartModel(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Catalog(title: 'Fruits'),
            '/cart': (context) => Cart()
          }),
    );
  }
}
