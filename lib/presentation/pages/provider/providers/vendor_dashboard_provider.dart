import 'package:flutter/material.dart';

class VendorDashboardProvider extends ChangeNotifier {
  double totalEarnings = 25400;
  double thisMonthEarnings = 8200;
  // int completed = 42;
  double rating = 4.8;

  double totalEarningsChange = 12; // %
  double thisMonthChange = 8; // %
  int completedChange = 5; // +
  final List<Map<String, dynamic>> requests = [
    {
      "name": "Priya Sharma",
      "type": "Normal",
      "price": 500,
      "service": "Bike Repair",
      "location": "Indore",
      "time": "2 hours ago"
    },
    {
      "name": "Rahul Kumar",
      "type": "Urgent",
      "price": 800,
      "service": "Emergency Repair",
      "location": "Bhopal",
      "time": "4 hours ago"
    },
  ];

  int totalRequests = 15;
  int completed = 12;
  double successRate = 0.8;
}
