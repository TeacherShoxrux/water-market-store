import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool emailNotifications = true;
  bool smsNotifications = true;
  String selectedPaymentMethod = "Credit Card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle("Store Details"),
            _buildTextField("Store Name", "Aqua Pure Store"),
            _buildTextField("Address", "123 Water Lane, Hydration City"),
            SizedBox(height: 20),

            _buildSectionTitle("Payment Preferences"),
            _buildDropdown("Preferred Payment Method", ["Credit Card", "PayPal", "Bank Transfer"]),

            SizedBox(height: 20),
            _buildSectionTitle("Notification Settings"),
            _buildSwitch("Email Notifications", emailNotifications, (value) {
              setState(() => emailNotifications = value);
            }),
            _buildSwitch("SMS Notifications", smsNotifications, (value) {
              setState(() => smsNotifications = value);
            }),

            SizedBox(height: 20),
            _buildSectionTitle("Account Security"),
            _buildTextField("Change Password", "Enter new password", obscureText: true),

            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Save Settings")),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTextField(String label, String placeholder, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(labelText: label, hintText: placeholder, border: OutlineInputBorder()),
    );
  }

  Widget _buildDropdown(String label, List<String> options) {
    return DropdownButtonFormField(
      value: selectedPaymentMethod,
      items: options.map((opt) => DropdownMenuItem(value: opt, child: Text(opt))).toList(),
      onChanged: (value) {
        setState(() => selectedPaymentMethod = value as String);
      },
      decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
    );
  }

  Widget _buildSwitch(String label, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(label),
      value: value,
      onChanged: onChanged,
    );
  }
}
