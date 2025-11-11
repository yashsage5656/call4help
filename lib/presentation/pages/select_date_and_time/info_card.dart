// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const InfoCard({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Text(
              value.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: color,
              ),
            ),
            Text(label, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
