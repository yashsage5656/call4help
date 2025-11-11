import 'package:flutter/material.dart';

class VendorSignUpProvider extends ChangeNotifier {
  bool _isCustomer = false;
  bool get isCustomer => _isCustomer;

  void onSignUpTap(BuildContext context) {
    Navigator.pushNamed(context, '/set_up_profile');
  }

  void onLoginTap(BuildContext context) {
    Navigator.pushNamed(context, '/phone_login');
  }

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }


  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }
}
