import 'package:flutter/material.dart';

class cartproduct extends StatefulWidget {
  @override
  _cartproductState createState() => _cartproductState();
}

class _cartproductState extends State<cartproduct> {
  var productsincart = [
    {"name": "panadol", "price": 30, "qantity": 1},
    {"name": "renieh", "price": 50, "qantity": 1},
    {"name": "mohanad", "price": 100, "qantity": 1},
    {"name": "yousef", "price": 200, "qantity": 1},
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: productsincart.length,
        itemBuilder: (context, index) {
          return new singlecard(
            name: productsincart[index]["name"],
            newPrice: productsincart[index]["price"],
            qty: productsincart[index]["qantity"],
          );
        });
  }
}

class singlecard extends StatelessWidget {
  final name;

  final newPrice;

  var qty;

  singlecard({
    this.newPrice,
    this.name,
    this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Card(
        child: ListTile(
          title: Text(name),
          subtitle: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Expanded(
                    child: Text("price=" + "\$${newPrice}"),
                  ),
                  Expanded(
                    child: new Column(
                      children: <Widget>[
                        new IconButton(
                            icon: Icon(
                              Icons.arrow_drop_up,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              qty = qty + 1;
                              /* setState(() {

                              });*/
                            }),
                        new Text("$qty"),
                        new IconButton(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              qty = qty - 1;
                              /*  setState(() {

                               });
                               */
                            }),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
