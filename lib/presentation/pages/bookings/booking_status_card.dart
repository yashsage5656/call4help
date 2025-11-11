import 'package:flutter/material.dart';

class BookingStatusCard extends StatelessWidget {
  const BookingStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF42A5F5);

    return Card(
      color: Color(0xffFBFCFC),
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(primaryColor: primaryColor),
            const Divider(height: 24),
            _DetailsSection(),
            const Divider(height: 24),
            // _ActionButtons(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final Color primaryColor;

  const _Header({required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.build, color: Colors.grey),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ram Mechanics',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('Bike Repair', style: TextStyle(color: Colors.grey)),
              Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('Indore, MP', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: primaryColor.withAlpha(12),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            'Confirmed',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailsSection extends StatelessWidget {
  const _DetailsSection();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: const [
          Expanded(
            child: _DetailColumn(
              title: 'Date & Time',
              value1: '2024-01-15',
              value2: '4:00 PM',
            ),
          ),
          Expanded(
            child: _DetailColumn(
              title: 'Amount',
              value1: '₹500',
              value2: 'Booking ID: BK001',
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailColumn extends StatelessWidget {
  final String title, value1, value2;

  const _DetailColumn({
    required this.title,
    required this.value1,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          value1,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 2),
        Text(value2, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}


