import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {

  void onServiceTap(BuildContext context) {
    Navigator.pushNamed(context, '/service_details');
  }
}
