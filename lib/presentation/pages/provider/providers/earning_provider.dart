import 'package:flutter/material.dart';

class EarningsProvider extends ChangeNotifier {
  double totalEarnings = 12450;
  double thisWeek = 2200;
  double thisMonth = 8500;
  int jobsDone = 32;

  final List<Map<String, dynamic>> recentEarnings = [
    {"title": "Home Service", "date": "Today", "amount": 300, "icon": Icons.home_repair_service},
    {"title": "Education", "date": "Yesterday", "amount": 450, "icon": Icons.person},
    {"title": "Mechanic", "date": "2 days ago", "amount": 200, "icon": Icons.departure_board_rounded},
    {"title": "Real Estate", "date": "3 days ago", "amount": 550, "icon": Icons.apartment},
  ];
}
