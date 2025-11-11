import 'package:flutter/material.dart';

class PaymentAndWalletProvider extends ChangeNotifier {
  double _balance = 1250.0;

  double get balance => _balance;

  void addMoney(double amount) {
    _balance += amount;
    notifyListeners();
  }
  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'Bike Repair',
      'vendor': 'Ram Mechanics',
      'amount': 500,
      'status': 'completed',
      'date': '2024-01-15',
      'time': '4:30 PM',
      'txnId': 'TXN123456789',
      'icon': Icons.build,
    },
  ];

  List<Map<String, dynamic>> get transactions => _transactions;

  final List<Map<String, dynamic>> savedCards = [
    {
      'type': 'Visa',
      'number': '4532',
      'expiry': '12/25',
      'isDefault': true,
      'gradient': [Colors.blue, Colors.purple],
    },
    {
      'type': 'Mastercard',
      'number': '8901',
      'expiry': '08/26',
      'isDefault': false,
      'gradient': [Colors.deepPurple, Colors.pink],
    },
  ];

  final List<Map<String, dynamic>> otherMethods = [
    {
      'icon': Icons.qr_code_2,
      'title': 'UPI',
      'subtitle': 'Pay with any UPI app',
      'status': 'Available',
    },
    {
      'icon': Icons.account_balance,
      'title': 'Net Banking',
      'subtitle': 'All major banks supported',
      'status': 'Available',
    },
    {
      'icon': Icons.monetization_on,
      'title': 'Cash on Delivery',
      'subtitle': 'Pay after service completion',
      'status': 'Available',
    },
  ];
}
