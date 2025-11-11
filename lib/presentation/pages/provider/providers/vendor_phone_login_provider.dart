import 'package:flutter/material.dart';

class VendorPhoneLoginProvider extends ChangeNotifier {
  bool _isCustomer = false;
  bool get isCustomer => _isCustomer;

  void onSignUpTap(BuildContext context) {
    Navigator.pushNamed(context, '/provider_sign_up');
  }

  void onSendOtpTap(BuildContext context) {
    Navigator.pushNamed(context, '/vendor_otp_verification');
  }


  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }


  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }
}
