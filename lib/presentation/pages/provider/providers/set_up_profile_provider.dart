import 'package:flutter/material.dart';

class SetUpProfileProvider extends ChangeNotifier {
  String? selectedServiceType;

  final List<String> serviceTypes = [
    "Cyber Café",
    "Real Estate",
    "Mechanic",
    "Beauty & Wellness",
    "Food Delivery",
    "Electronics Repair",
  ];


  void selectService(String? value) {
    selectedServiceType = value;
    notifyListeners();
  }

  void onCompleteSetUpTap(BuildContext context) {
    Navigator.pushNamed(context, '/provider_bottom_nav');
  }
}
