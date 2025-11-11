import 'package:flutter/material.dart';

class LoginWithPhoneProvider extends ChangeNotifier {
  bool _isCustomer = false;
  bool get isCustomer => _isCustomer;

  void onSignUpTap(BuildContext context) {
    Navigator.pushNamed(context, '/sign_up');
  }

  void onSendOtpTap(BuildContext context) {
    Navigator.pushNamed(context, '/otp_verification');
  }


  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }


  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }
}
