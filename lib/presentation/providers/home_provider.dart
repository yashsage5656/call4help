import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
  void selectCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void onServicesTap(BuildContext context) {
    Navigator.pushNamed(context, '/services');
  }

  void onEmergencyTap(BuildContext context) {
    Navigator.pushNamed(context, '/emergency_help');
  }

  final categories = [
    {
      "title": "Emergency",
      "sub": "Urgent Help 24/7",
      "icon": "assets/siren.png",
    },
    {
      "title": "Mechanic",
      "sub": "Car & Bike Repair",
      "icon": "assets/category/mecanic2-removebg-preview.png",
    },
    {
      "title": "Home Services",
      "sub": "Cleaning & Repairs",
      "icon": "assets/category/home2-removebg-preview.png",
    },
    {
      "title": "Education",
      "sub": "Tutors & Coaching",
      "icon": "assets/category/education2-removebg-preview.png",
    },
    {
      "title": "Cyber Cafe",
      "sub": "Internet & Printing",
      "icon": "assets/category/cyber_cafe2-removebg-preview.png",
    },
    {
      "title": "Real Estate",
      "sub": "Properties",
      "icon": "assets/category/real_estate2-removebg-preview.png",
    },
  ];


}
