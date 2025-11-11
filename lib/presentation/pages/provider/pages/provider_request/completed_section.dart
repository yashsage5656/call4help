import 'package:flutter/material.dart';

class CompletedSection extends StatelessWidget {
  const CompletedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bookings = [
      BookingData(
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
      BookingData(
        title: 'Sharma Coaching',
        subtitle: 'Tutor and Consultant',
        rating: 4.0,
        ratingCount: 4,
        price: '1200',
        date: '2024-01-08',
        reviewQuote: 'Very helpful and professional',
        icon: Icons.person,
        iconColor: Colors.brown,
      ),
    ];

    return Column(
      children: bookings
          .map((data) => BookingCard(data: data))
          .toList(),
    );
  }
}

class BookingData {
  final String title, subtitle, price, date, reviewQuote;
  final double rating;
  final int ratingCount;
  final IconData icon;
  final Color iconColor;

  BookingData({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.date,
    required this.reviewQuote,
    required this.icon,
    required this.iconColor,
  });
}

class BookingCard extends StatelessWidget {
  final BookingData data;

  const BookingCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(data: data),
            const Divider(height: 24),
            Text('"${data.reviewQuote}"', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            const _Actions(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final BookingData data;

  const _Header({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: data.iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(data.icon, color: data.iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(data.subtitle, style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 4),
              Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                          (i) => Icon(
                        i < data.rating.floor() ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      ),
                    ),
                  ),
                  Text(' (${data.ratingCount})', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('₹${data.price}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(data.date, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('Book Again', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.star_border, size: 20, color: Colors.black54),
          label: const Text('Rate', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
        ),
      ],
    );
  }
}
