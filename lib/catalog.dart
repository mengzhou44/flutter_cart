import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart-model.dart';
import 'models/catalog-model.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), elevation: 2.0, actions: [
        IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            })
      ]),
      body: Container(
          color: Colors.black12,
          child: ListView(children: _buildItems(context))),
    );
  }

  List<Widget> _buildItems(BuildContext context) {
    CatalogModel catalog = Provider.of<CatalogModel>(context);
    CartModel cart = Provider.of<CartModel>(context);
    return catalog.items
        .map(
          (item) => Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.name),
                Text(item.unitPrice.toString()),
                RaisedButton(
                    child: Text('add'),
                    onPressed: () {
                      cart.add(item);
                    })
              ],
            ),
            decoration: BoxDecoration(
                border: new Border.all(
                    color: Colors.blue, width: 2.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
        )
        .toList();
  }
}
