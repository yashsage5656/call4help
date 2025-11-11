import 'package:flutter/material.dart';

class VendorProfileProvider extends ChangeNotifier {
  bool _isAvailable = false;

  bool get isAvailable => _isAvailable;

  void toggleAvailability() {
    _isAvailable = !_isAvailable;
    notifyListeners();
  }

  void onBecomeUserTap(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/phone_login', (route) => false);
  }

  void onLogoutTap(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/vendor_phone_login', (route) => false);
  }



  final List<Map<String, dynamic>> recentEarnings = [
    {
      "title": "Edit Business Info",
      "subTitle": "Update your service details",
      "icon": Icons.edit,
      "trailingIcon": Icons.arrow_forward_ios,
    },

    {
      "title": "Reviews & Ratings",
      "subTitle": "View customer feedback",
      "icon": Icons.star,
      "trailingIcon": Icons.arrow_forward_ios,
    },
    {
      "title": "Payment Settings",
      "subTitle": "Bank account & UPI details",
      "icon": Icons.wallet,
      "trailingIcon": Icons.arrow_forward_ios,
    },
    {
      "title": "Business Hours",
      "subTitle": "Set your availability",
      "icon": Icons.settings,
      "trailingIcon": Icons.arrow_forward_ios,
    },

  ];
}
