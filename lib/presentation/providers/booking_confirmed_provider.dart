// booking_confirmation_provider.dart
import 'package:flutter/material.dart';

class BookingConfirmationProvider extends ChangeNotifier {
  final String bookingId = "BKZZ3INSG03";
  final String providerName = "Ram Bike Mechanics";
  final String serviceType = "Basic";
  final String dateTime = "2025-10-14 at 9:00 AM";
  final double amountPaid = 500.0;

  // In case you need to load from API later
  void fetchBookingDetails() {
    // TODO: implement API call if required
    notifyListeners();
  }
  void onTrackBookingTap(BuildContext context) {
    Navigator.pushNamed(context, '/track_booking');
  }
  void onHomeTap(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }
}
