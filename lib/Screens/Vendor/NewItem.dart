import 'package:flutter/material.dart';
import 'package:food_app_frontend/Services/Vendor/VendorServices.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class NewItem extends StatefulWidget {
  final user;
  const NewItem({this.user});
  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  File _image;
  final ImagePicker _picker = ImagePicker();
  String itemName;
  var price;
  final primaryColor = Color.fromRGBO(13, 71, 161, 1);
  final fontColor = Colors.grey[800];
  final secondryColor = Color.fromRGBO(253, 216, 53, 1);
  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.0,
          title: Text('Food Menu'),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: Material(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Form(
              child: Stack(
                children: [
                  Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            itemName = value;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: 'Item Name', hintText: 'Fried Rice'),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            price = num.tryParse(value);
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Price',
                        ),
                      ),
                    ],
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      elevation: 10,
                      padding: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Text('Submit'),
                      onPressed: () {
                        setState(() {
                          VendorServices().storeNewitem(itemName, price);
                        });
                      },
                    ),
                  ),
                  //IconButton(
                  //  icon: Icon(Icons.camera),
                  //  onPressed: getImage,
                  //),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
