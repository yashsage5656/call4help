import 'package:flutter/material.dart';

class CompleteProfileProvider extends ChangeNotifier {
  bool _isCustomer = false;
  bool get isCustomer => _isCustomer;

  void onCompleteProfileTap(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
  }


  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }
}
