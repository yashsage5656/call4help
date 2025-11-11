import 'package:flutter/material.dart';

class SelectPaymentMethodProvider extends ChangeNotifier {
  int _selectedPaymentIndex = -1;

  int get selectedPaymentIndex => _selectedPaymentIndex;

  void selectPaymentMethod(int index) {
    _selectedPaymentIndex = index;
    notifyListeners();
  }

  void onConfirmAndPayTap(BuildContext context) {
    Navigator.pushNamed(context, '/booking_confirmed');
  }
}
