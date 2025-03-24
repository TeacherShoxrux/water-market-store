import 'package:flutter/material.dart';
import 'package:water_market_store/UI/pages/products/widgets/edit_alert.dart';
import 'package:water_market_store/UI/pages/products/widgets/product_add_alert.dart';

class ProductManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stock Management")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Stock Management",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddProductDialog(),
                );
              },
              child: Text("Add New Product"),
            ),
            SizedBox(height: 10),

            /// Jadval scroll bo'lishi uchun qo'shildi
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20,
                    columns: [
                      DataColumn(label: Text("Product Name")),
                      DataColumn(label: Text("Current Stock")),
                      DataColumn(label: Text("Purchase Price")),
                      DataColumn(label: Text("Supplier")),
                      DataColumn(label: Text("Actions")),
                    ],
                    rows: [
                      stockDataRow("Natural Spring Water", "120", "\$15.00", "Aqua Supplier Co." ,context),
                      stockDataRow("Mineral Water", "85", "\$12.00", "ClearWater Supplies",context),
                      stockDataRow("Sparkling Water", "200", "\$18.00", "Sparkle Solutions",context),
                      stockDataRow("Natural Spring Water", "120", "\$15.00", "Aqua Supplier Co.",context),
                      stockDataRow("Mineral Water", "85", "\$12.00", "ClearWater Supplies",context),
                      stockDataRow("Sparkling Water", "200", "\$18.00", "Sparkle Solutions",context),
                      stockDataRow("Natural Spring Water", "120", "\$15.00", "Aqua Supplier Co.",context),
                      stockDataRow("Mineral Water", "85", "\$12.00", "ClearWater Supplies",context),
                      stockDataRow("Sparkling Water", "200", "\$18.00", "Sparkle Solutions",context),
                      stockDataRow("Natural Spring Water", "120", "\$15.00", "Aqua Supplier Co.",context),
                      stockDataRow("Mineral Water", "85", "\$12.00", "ClearWater Supplies",context),
                      stockDataRow("Sparkling Water", "200", "\$18.00", "Sparkle Solutions",context),
                      stockDataRow("Natural Spring Water", "120", "\$15.00", "Aqua Supplier Co.",context),
                      stockDataRow("Mineral Water", "85", "\$12.00", "ClearWater Supplies",context),
                      stockDataRow("Sparkling Water", "200", "\$18.00", "Sparkle Solutions",context),
                      stockDataRow("Natural Spring Water", "120", "\$15.00", "Aqua Supplier Co.",context),
                      stockDataRow("Mineral Water", "85", "\$12.00", "ClearWater Supplies",context),
                      stockDataRow("Sparkling Water", "200", "\$18.00", "Sparkle Solutions",context),
                      stockDataRow("Natural Spring Water", "120", "\$15.00", "Aqua Supplier Co.",context),
                      stockDataRow("Mineral Water", "85", "\$12.00", "ClearWater Supplies",context),
                      stockDataRow("Sparkling Water", "200", "\$18.00", "Sparkle Solutions",context),
                      stockDataRow("Natural Spring Water", "120", "\$15.00", "Aqua Supplier Co.",context),
                      stockDataRow("Mineral Water", "85", "\$12.00", "ClearWater Supplies",context),
                      stockDataRow("Sparkling Water", "200", "\$18.00", "Sparkle Solutions",context),
                      stockDataRow("Natural Spring Water", "120", "\$15.00", "Aqua Supplier Co.",context),
                      stockDataRow("Mineral Water", "85", "\$12.00", "ClearWater Supplies",context),
                      stockDataRow("Sparkling Water", "200", "\$18.00", "Sparkle Solutions",context),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            /// Yangi mahsulot qo'shish formasi
            Text(
              "Add Stock Entry",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// Mahsulotlar jadvali uchun helper function
  DataRow stockDataRow(String name, String stock, String price, String supplier,BuildContext context) {
    return DataRow(cells: [
      DataCell(Text(name)),
      DataCell(Text(stock)),
      DataCell(Text(price)),
      DataCell(Text(supplier)),
      DataCell(ElevatedButton(onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return EditAlert(product:  {"name": "Natural Spring Water", "stock": 120, "price": 15.00, "supplier": "Aqua Supplier Co."});
          },
        );
      }, child: Text("Edit"))),
    ]);
  }
}