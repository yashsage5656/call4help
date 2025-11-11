import 'package:flutter/material.dart';

class CustomerRegistrationProvider extends ChangeNotifier {
  bool _isCustomer = false;
  bool get isCustomer => _isCustomer;

  void onSendOtpTap(BuildContext context) {
    Navigator.pushNamed(context, '/phone_login');
  }

  void onLoginTap(BuildContext context) {
    Navigator.pushNamed(context, '/phone_login');
  }


  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }
}
