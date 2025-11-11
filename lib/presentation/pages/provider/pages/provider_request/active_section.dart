import 'package:flutter/material.dart';

class ActiveSection extends StatelessWidget {
  const ActiveSection({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF42A5F5);

    final cardsData = List.generate(
      2,
          (_) => ActiveCardData(
        title: 'Ram Mechanics',
        subtitle: 'Bike Repair',
        location: 'Indore, MP',
        status: 'Active',
        date: '2024-01-15',
        time: '4:00 PM',
        amount: '₹500',
        bookingId: 'BK001',
      ),
    );

    return Column(
      children: cardsData.map((data) => _ActiveCard(data: data, primaryColor: primaryColor)).toList(),
    );
  }
}

class ActiveCardData {
  final String title, subtitle, location, status, date, time, amount, bookingId;
  ActiveCardData({
    required this.title,
    required this.subtitle,
    required this.location,
    required this.status,
    required this.date,
    required this.time,
    required this.amount,
    required this.bookingId,
  });
}

class _ActiveCard extends StatelessWidget {
  final ActiveCardData data;
  final Color primaryColor;

  const _ActiveCard({required this.data, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffFBFCFC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(data: data, primaryColor: primaryColor),
            const Divider(height: 24),
            _DetailsSection(data: data),
            const Divider(height: 24),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final ActiveCardData data;
  final Color primaryColor;

  const _Header({required this.data, required this.primaryColor});

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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(data.subtitle, style: const TextStyle(color: Colors.grey)),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(data.location, style: const TextStyle(color: Colors.grey)),
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
          child: Text(data.status,
              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
        ),
      ],
    );
  }
}

class _DetailsSection extends StatelessWidget {
  final ActiveCardData data;
  const _DetailsSection({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _DetailColumn(title: 'Date & Time', value1: data.date, value2: data.time),
        ),
        Expanded(
          child: _DetailColumn(title: 'Amount', value1: data.amount, value2: 'Booking ID: ${data.bookingId}'),
        ),
      ],
    );
  }
}

class _DetailColumn extends StatelessWidget {
  final String title, value1, value2;

  const _DetailColumn({required this.title, required this.value1, required this.value2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(value1, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 2),
        Text(value2, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}
