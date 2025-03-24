import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  String selectedStatus = "Pending"; // Default status
  DateTime selectedDate = DateTime.now(); // Default date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orders")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Total Earnings & Filters
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Daily Earnings: \$1,250",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  Row(
                    children: [
                      /// Date Picker
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),

                      /// Status Filter
                      DropdownButton<String>(
                        value: selectedStatus,
                        items: ["Pending", "In Progress", "Delivered"]
                            .map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedStatus = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            /// Orders Table
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text("Order ID")),
                      DataColumn(label: Text("Customer Name")),
                      DataColumn(label: Text("Delivery Address")),
                      DataColumn(label: Text("Status")),
                      DataColumn(label: Text("Payment Type")),
                    ],
                    rows: [
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),
                      _buildOrderRow("#12345", "Alex Johnson", "123 Water St.", "Pending", "Cash"),
                      _buildOrderRow("#12346", "Maria Garcia", "456 Aqua Ln.", "In Progress", "P2P"),
                      _buildOrderRow("#12347", "John Smith", "789 River Rd.", "Delivered", "Cash"),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Function to Create Rows
  DataRow _buildOrderRow(String id, String customer, String address, String status, String payment) {
    return DataRow(cells: [
      DataCell(Text(id)),
      DataCell(Text(customer)),
      DataCell(Text(address, style: TextStyle(color: Colors.blue))),
      DataCell(Text(status, style: TextStyle(fontWeight: FontWeight.bold))),
      DataCell(Text(payment)),
    ]);
  }
}
