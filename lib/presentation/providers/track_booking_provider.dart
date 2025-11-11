import 'package:flutter/material.dart';

class TrackBookingProvider extends ChangeNotifier {
  bool isConfirmed = true;
  bool isCancelled = false;

  void cancelService() {
    isCancelled = true;
    notifyListeners();
  }
}
