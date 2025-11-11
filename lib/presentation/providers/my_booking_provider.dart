import 'package:call4help/presentation/pages/bookings/booking_card.dart';
import 'package:call4help/presentation/pages/bookings/booking_status_card.dart';
import 'package:flutter/material.dart';

class BookingHistoryProvider extends ChangeNotifier {
  final List<BookingStatusCard> _activeBookings = [const BookingStatusCard(),];

  final List<BookingCard> _historyBookings = [
    BookingCard(
      title: 'Sharma Tutors',
      subtitle: 'Math Tutoring',
      rating: 5.0,
      ratingCount: 5,
      price: '800',
      date: '2024-01-10',
      reviewQuote: 'Excellent teaching methods!',
      icon: Icons.school,
      iconColor: Colors.blue,
    ),
    BookingCard(
      title: 'Property Experts',
      subtitle: 'Property Consultation',
      rating: 4.0,
      ratingCount: 4,
      price: '1200',
      date: '2024-01-08',
      reviewQuote: 'Very helpful and professional',
      icon: Icons.home,
      iconColor: Colors.brown,
    ),
  ];

  List<BookingStatusCard> get activeBookings => _activeBookings;

  List<BookingCard> get historyBookings => _historyBookings;
}
