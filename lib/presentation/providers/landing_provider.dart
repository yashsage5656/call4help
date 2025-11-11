import 'package:flutter/material.dart';

class LandingProvider extends ChangeNotifier {
  bool _isCustomer = false;
  bool get isCustomer => _isCustomer;

  void onSignUpTap(BuildContext context) {
    Navigator.pushNamed(context, '/sign_up');
  }

  void onLoginTap(BuildContext context) {
    Navigator.pushNamed(context, '/phone_login');
  }


  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }
}
