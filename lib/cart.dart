import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart-model.dart';

class Cart extends StatelessWidget {
  const Cart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartModel cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart'), elevation: 2.0),
      body: Container(
          color: Colors.black12,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            _cartContent(cart),
            Divider(
              height: 1,
              color: Colors.lightBlue,
            ),
            SizedBox(height: 20),
            _footer(cart)
          ])),
    );
  }

  Widget _cartContent(CartModel cart) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: cart.cartItems.length,
            itemBuilder: (BuildContext ctxt, int index) {
              var item = cart.cartItems[index];
              return SizedBox(
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.name),
                      Text(item.unitPrice.toString()),
                      Text(item.quantities.toString())
                    ]),
              );
            }),
      ),
    );
  }

  Widget _footer(CartModel cart) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text('Total', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
        SizedBox(width: 30),
        Text('${cart.totalAmount.toString()}',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
      ]),
    );
  }
}
