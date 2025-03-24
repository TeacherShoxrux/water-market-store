import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditAlert extends StatelessWidget {
  const EditAlert({super.key, required this.product});
  final Map<String, dynamic> product;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit Product"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: product['name'],
            decoration: InputDecoration(labelText: "Product Name"),
          ),
          TextFormField(
            initialValue: product['stock'].toString(),
            decoration: InputDecoration(labelText: "Current Stock"),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            initialValue: product['price'].toString(),
            decoration: InputDecoration(labelText: "Purchase Price"),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
