import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final item;
  const ItemDetails({this.item});
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  final primaryColor = Color.fromRGBO(13, 71, 161, 1);
  final fontColor = Colors.grey[800];
  final secondryColor = Color.fromRGBO(253, 216, 53, 1);
  int ammount = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      height: 30.0,
                      child: IconButton(
                        padding: EdgeInsets.all(0.0),
                        alignment: Alignment.topLeft,
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                  Image(height: 250.0, image: AssetImage('images/burger.jpg'))
                ],
              ),
            ),
            Material(
              elevation: 20.0,
              child: Container(
                width: 300,
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.fastfood),
                            ),
                            Text('Chiken'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  ButtonTheme(
                    buttonColor: secondryColor,
                    minWidth: 10.0,
                    height: 30.0,
                    child: RaisedButton(
                        elevation: 10.0,
                        child: Icon(
                          Icons.remove,
                          size: 14.0,
                        ),
                        onPressed: () {
                          setState(() {
                            ammount -= 1;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(ammount.toString()),
                      ],
                    ),
                  ),
                  ButtonTheme(
                    buttonColor: secondryColor,
                    minWidth: 10.0,
                    height: 30.0,
                    child: RaisedButton(
                        elevation: 10.0,
                        child: Icon(
                          Icons.add,
                          size: 14.0,
                        ),
                        onPressed: () {
                          setState(() {
                            ammount += 1;
                          });
                        }),
                  ),
                  Expanded(
                      child: Container(
                          alignment: Alignment.topRight,
                          child: Text(itemPrice.toString()))),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              child: ButtonTheme(
                minWidth: 500,
                height: 50,
                child: RaisedButton(
                  color: Colors.amber,
                  onPressed: () {},
                  child: Text(
                    'Order',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
