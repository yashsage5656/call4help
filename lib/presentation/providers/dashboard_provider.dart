import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  final categories = [
    {
      "title": "Emergency",
      "sub": "Urgent Help 24/7",
      "icon": "assets/siren.png",
    },
    {
      "title": "Mechanic",
      "sub": "Car & Bike Repair",
      "icon": "assets/settings.png",
    },
    {
      "title": "Home Services",
      "sub": "Cleaning & Repairs",
      "icon": "assets/house.png",
    },
    {
      "title": "Education",
      "sub": "Tutors & Coaching",
      "icon": "assets/book.png",
    },
    {
      "title": "Cyber Cafe",
      "sub": "Internet & Printing",
      "icon": "assets/monitor.png",
    },
    {
      "title": "Real Estate",
      "sub": "Properties",
      "icon": "assets/office-building.png",
    },
  ];

  bool _isCustomer = false;

  bool get isCustomer => _isCustomer;

  void onEmergencyHelpTap(BuildContext context) {
    Navigator.pushNamed(context, '/emergency_help');
  }

  void onServiceTap(BuildContext context) {
    Navigator.pushNamed(context, '/services');
  }

  void onRecentActivityTap(BuildContext context) {
    Navigator.pushNamed(context, '/my_bookings');
  }

  void onPaymentsTap(BuildContext context) {
    Navigator.pushNamed(context, '/payments_and_wallet');
  }

  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }
}
