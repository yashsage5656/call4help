import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String title, subtitle, price, date, reviewQuote;
  final double rating;
  final int ratingCount;
  final IconData icon;
  final Color iconColor;

  const BookingCard({
    super.key,
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
            _Header(
              title: title,
              subtitle: subtitle,
              rating: rating,
              ratingCount: ratingCount,
              price: price,
              date: date,
              icon: icon,
              iconColor: iconColor,
            ),
            const Divider(height: 24),
            Text(
              '"$reviewQuote"',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            _Actions(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title, subtitle, price, date;
  final double rating;
  final int ratingCount;
  final IconData icon;
  final Color iconColor;

  const _Header({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.date,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(subtitle, style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 4),
              Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (i) => Icon(
                        i < rating.floor() ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      ),
                    ),
                  ),
                  Text(
                    ' ($ratingCount)',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '₹$price',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(date, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Book Again',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.star_border, size: 20, color: Colors.black54),
          label: const Text(
            'Rate',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
