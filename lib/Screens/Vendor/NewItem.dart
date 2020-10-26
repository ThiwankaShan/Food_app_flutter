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
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            child: Column(
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
                      price = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                FlatButton(
                  color: Colors.blue,
                  child: Text('Submit'),
                  onPressed: () {
                    setState(() {
                      VendorServices().storeNewitem(itemName, price);
                    });
                  },
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
    );
  }
}
