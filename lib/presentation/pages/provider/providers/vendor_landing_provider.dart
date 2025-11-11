import 'package:flutter/material.dart';

class VendorLandingProvider extends ChangeNotifier {
  bool _isCustomer = false;
  bool get isCustomer => _isCustomer;

  void onSignUpTap(BuildContext context) {
    Navigator.pushNamed(context, '/provider_sign_up');
  }

  void onLoginTap(BuildContext context) {
    Navigator.pushNamed(context, '/vendor_phone_login');
  }


  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }
}
