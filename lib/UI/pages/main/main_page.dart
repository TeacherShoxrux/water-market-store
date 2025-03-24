import 'package:flutter/material.dart';

import '../delivers/delivers_page.dart';
import '../home/home_page.dart';
import '../orders/order_page.dart';
import '../products/products_page.dart';
import '../reports/reports_page.dart';
import '../settings/settings.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProductManagementPage(),
    DeliveryManagementPage(),
    OrdersPage(),
    ReportsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WaterStore Dashboard'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                selectedIcon: Icon(Icons.dashboard, color: Colors.blue),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart),
                selectedIcon: Icon(Icons.shopping_cart, color: Colors.blue),
                label: Text('Products'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.car_crash),
                selectedIcon: Icon(Icons.car_crash, color: Colors.blue),
                label: Text('Deliver'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.list_alt),
                selectedIcon: Icon(Icons.list_alt, color: Colors.blue),
                label: Text('Orders'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart),
                selectedIcon: Icon(Icons.bar_chart, color: Colors.blue),
                label: Text('Reports'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                selectedIcon: Icon(Icons.settings, color: Colors.blue),
                label: Text('Settings'),
              ),
            ],
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}