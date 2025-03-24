import 'package:flutter/material.dart';
import 'package:water_market_store/UI/pages/main/widgets/sidebar_item.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key, required this.items});
  final List<Widget> items;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {


  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      color: Colors.blueGrey[900],
      child: ListView(
        padding: const EdgeInsets.all(16),
        children:  [
          Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 20)),
          Divider(color: Colors.white54),
          SizedBox( width: 100,
            height: MediaQuery.of(context).size.height -100,
            child: NavigationRail(
              extended: false,
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
                  icon: Icon(Icons.inventory),
                  selectedIcon: Icon(Icons.inventory, color: Colors.blue),
                  label: Text('Stock Management'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.receipt),
                  selectedIcon: Icon(Icons.receipt, color: Colors.blue),
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
          )
        ],
      ),
    );
  }
}