import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddDriverDialog extends StatefulWidget {
  final Function(Map<String, String>) onAddDriver;

  AddDriverDialog({required this.onAddDriver});

  @override
  _AddDriverDialogState createState() => _AddDriverDialogState();
}

class _AddDriverDialogState extends State<AddDriverDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController plateController = TextEditingController();
  String vehicleType = "Car";
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _saveDriver() {
    if (nameController.text.isEmpty || phoneController.text.isEmpty || plateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all required fields")),
      );
      return;
    }
    widget.onAddDriver({
      "name": nameController.text,
      "phone": phoneController.text,
      "vehicle": vehicleType,
      "plate": plateController.text,
      "photo": _imageFile?.path ?? "",
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Delivery Driver"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Full Name")),
            TextField(controller: phoneController, keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: "Phone Number")),
            DropdownButtonFormField<String>(
              value: vehicleType,
              items: ["Car", "Van", "Truck", "Scooter"]
                  .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                  .toList(),
              onChanged: (value) => setState(() => vehicleType = value!),
              decoration: InputDecoration(labelText: "Vehicle Type"),
            ),
            TextField(controller: plateController, decoration: InputDecoration(labelText: "License Plate Number")),
            SizedBox(height: 10),
            Text("Profile Photo (Optional)"),
            _imageFile == null
                ? IconButton(icon: Icon(Icons.upload), onPressed: _pickImage)
                : Image.file(_imageFile!, height: 80),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _saveDriver, child: Text("Save")),
                TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
