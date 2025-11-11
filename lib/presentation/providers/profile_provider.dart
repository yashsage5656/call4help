import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String name = "Yash";
  String email = "test@gmail.com";
  String phone = "6543234565";
  int totalBookings = 12;
  double avgRating = 4.8;
  double totalSpent = 5200;

  List<Map<String, dynamic>> recentBookings = [
    {
      "title": "Ram Bike Mechanics",
      "subtitle": "Bike Repair",
      "price": 500,
      "status": "Completed",
      "rating": 5,
      "time": "Yesterday",
    },
    {
      "title": "Digital Point Cyber Café",
      "subtitle": "Internet Usage",
      "price": 40,
      "status": "Completed",
      "rating": 4,
      "time": "3 days ago",
    },
  ];

  void onBecomeProviderTap(BuildContext context) {
    Navigator.pushNamed(context, '/vendor_phone_login');
  }

  void onLogOutTap(BuildContext context) {
    Navigator.pushNamed(context, '/phone_login');
  }
}