import 'package:flutter/material.dart';

class ServiceBookingProvider extends ChangeNotifier {
  String selectedService = "Premium Service";
  bool isCustomPrice = false;
  double originalPrice = 800;
  double offerPrice = 1080;
  TextEditingController requirementController = TextEditingController();

  void selectService(String service) {
    selectedService = service;
    notifyListeners();
  }

  void toggleCustomPrice(bool? value) {
    isCustomPrice = value ?? false;
    notifyListeners();
  }
  void updateOffer(double value) {
    offerPrice = value;
    notifyListeners();
  }
  void onSelectDateTap(BuildContext context) {
    Navigator.pushNamed(context, '/select_date_and_time');
  }
}