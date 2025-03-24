import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final List<Map<String, String>> inventory = [
    {
      "product": "Mineral Water 500ml",
      "quantity": "200",
      "price": "\$150",
      "supplier": "AquaPure Supplies",
      "date": "2023-10-15",
    },
    {
      "product": "Spring Water 750ml",
      "quantity": "150",
      "price": "\$120",
      "supplier": "FreshFlow Distributors",
      "date": "2023-10-14",
    },
    {
      "product": "Alkaline Water 1L",
      "quantity": "100",
      "price": "\$200",
      "supplier": "ClearWater Partners",
      "date": "2023-10-13",
    },
    {
      "product": "Mineral Water 500ml",
      "quantity": "200",
      "price": "\$150",
      "supplier": "AquaPure Supplies",
      "date": "2023-10-15",
    },
    {
      "product": "Spring Water 750ml",
      "quantity": "150",
      "price": "\$120",
      "supplier": "FreshFlow Distributors",
      "date": "2023-10-14",
    },
    {
      "product": "Alkaline Water 1L",
      "quantity": "100",
      "price": "\$200",
      "supplier": "ClearWater Partners",
      "date": "2023-10-13",
    },
    {
      "product": "Mineral Water 500ml",
      "quantity": "200",
      "price": "\$150",
      "supplier": "AquaPure Supplies",
      "date": "2023-10-15",
    },
    {
      "product": "Spring Water 750ml",
      "quantity": "150",
      "price": "\$120",
      "supplier": "FreshFlow Distributors",
      "date": "2023-10-14",
    },
    {
      "product": "Alkaline Water 1L",
      "quantity": "100",
      "price": "\$200",
      "supplier": "ClearWater Partners",
      "date": "2023-10-13",
    },
    {
      "product": "Mineral Water 500ml",
      "quantity": "200",
      "price": "\$150",
      "supplier": "AquaPure Supplies",
      "date": "2023-10-15",
    },
    {
      "product": "Spring Water 750ml",
      "quantity": "150",
      "price": "\$120",
      "supplier": "FreshFlow Distributors",
      "date": "2023-10-14",
    },
    {
      "product": "Alkaline Water 1L",
      "quantity": "100",
      "price": "\$200",
      "supplier": "ClearWater Partners",
      "date": "2023-10-13",
    },
    {
      "product": "Mineral Water 500ml",
      "quantity": "200",
      "price": "\$150",
      "supplier": "AquaPure Supplies",
      "date": "2023-10-15",
    },
    {
      "product": "Spring Water 750ml",
      "quantity": "150",
      "price": "\$120",
      "supplier": "FreshFlow Distributors",
      "date": "2023-10-14",
    },
    {
      "product": "Alkaline Water 1L",
      "quantity": "100",
      "price": "\$200",
      "supplier": "ClearWater Partners",
      "date": "2023-10-13",
    },
    {
      "product": "Mineral Water 500ml",
      "quantity": "200",
      "price": "\$150",
      "supplier": "AquaPure Supplies",
      "date": "2023-10-15",
    },
    {
      "product": "Spring Water 750ml",
      "quantity": "150",
      "price": "\$120",
      "supplier": "FreshFlow Distributors",
      "date": "2023-10-14",
    },
    {
      "product": "Alkaline Water 1L",
      "quantity": "100",
      "price": "\$200",
      "supplier": "ClearWater Partners",
      "date": "2023-10-13",
    },
    {
      "product": "Mineral Water 500ml",
      "quantity": "200",
      "price": "\$150",
      "supplier": "AquaPure Supplies",
      "date": "2023-10-15",
    },
    {
      "product": "Spring Water 750ml",
      "quantity": "150",
      "price": "\$120",
      "supplier": "FreshFlow Distributors",
      "date": "2023-10-14",
    },
    {
      "product": "Alkaline Water 1L",
      "quantity": "100",
      "price": "\$200",
      "supplier": "ClearWater Partners",
      "date": "2023-10-13",
    },
  ];

  final List<Map<String, String>> earnings = [
    {"type": "Daily", "amount": "\$500"},
    {"type": "Weekly", "amount": "\$3500"},
    {"type": "Monthly", "amount": "\$15000"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reports")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Inventory Purchases",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Reports",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Filter by date range",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  earnings
                      .map(
                        (e) => Text(
                          "${e['type']} Earnings: ${e['amount']}",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Filter by date range",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Product Name")),
                    DataColumn(label: Text("Quantity")),
                    DataColumn(label: Text("Purchase Price")),
                    DataColumn(label: Text("Supplier Details")),
                    DataColumn(label: Text("Purchase Date")),
                  ],
                  rows:
                      inventory.map((item) {
                        return DataRow(
                          cells: [
                            DataCell(Text(item["product"]!)),
                            DataCell(Text(item["quantity"]!)),
                            DataCell(Text(item["price"]!)),
                            DataCell(Text(item["supplier"]!)),
                            DataCell(Text(item["date"]!)),
                          ],
                        );
                      }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
