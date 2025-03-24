import 'package:flutter/material.dart';
import 'package:water_market_store/UI/pages/delivers/widgets/add_deliver.dart';

class DeliveryManagementPage extends StatefulWidget {
  @override
  _DeliveryManagementPageState createState() => _DeliveryManagementPageState();
}

class _DeliveryManagementPageState extends State<DeliveryManagementPage> {
  List<Map<String, String>> drivers = [
    {"name": "John Smith", "phone": "123-456-7890", "vehicle": "Van", "plate": "XYZ-1234", "status": "Available"},
    {"name": "Emily Johnson", "phone": "987-654-3210", "vehicle": "Truck", "plate": "ABC-5678", "status": "On a Delivery"},
    {"name": "Michael Brown", "phone": "555-234-5678", "vehicle": "Scooter", "plate": "LMN-9876", "status": "Available"},
  ];

  void _editDriver(int index) {
    TextEditingController phoneController = TextEditingController(text: drivers[index]["phone"]);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Driver"),
        content: TextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(labelText: "Phone Number"),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              setState(() {
                drivers[index]["phone"] = phoneController.text;
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  void _removeDriver(int index) {
    setState(() {
      drivers.removeAt(index);
    });
  }

  void _addDriver() {
    showDialog(
      context: context,
      builder: (context) => AddDriverDialog(
        onAddDriver: (driver) {
          setState(() {
            drivers.add(driver);
          });
        },
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delivery Management")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Title and Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Drivers", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: _addDriver,
                  child: Text("Add Delivery Driver"),
                ),
              ],
            ),
            SizedBox(height: 10),

            /// Scrollable DataTable
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text("Full Name")),
                      DataColumn(label: Text("Phone Number")),
                      DataColumn(label: Text("Vehicle Type")),
                      DataColumn(label: Text("License Plate")),
                      DataColumn(label: Text("Status")),
                      DataColumn(label: Text("Actions")),
                    ],
                    rows: drivers.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, String> driver = entry.value;
                      return DataRow(cells: [
                        DataCell(Text(driver["name"]!)),
                        DataCell(
                          GestureDetector(
                            onTap: () => _editDriver(index),
                            child: Text(driver["phone"]!, style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                          ),
                        ),
                        DataCell(Text(driver["vehicle"]!)),
                        DataCell(Text(driver["plate"]!)),
                        DataCell(Text(driver["status"]!)),
                        DataCell(
                          Row(
                            children: [
                              TextButton(onPressed: () => _editDriver(index), child: Text("Edit")),
                              TextButton(onPressed: () => _removeDriver(index), child: Text("Remove", style: TextStyle(color: Colors.red))),
                            ],
                          ),
                        ),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
