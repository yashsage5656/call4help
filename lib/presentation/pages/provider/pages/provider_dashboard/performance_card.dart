import 'package:flutter/material.dart';

class PerformanceCard extends StatelessWidget {
  final int requests;
  final int completed;
  final double successRate;

  const PerformanceCard({
    super.key,
    required this.requests,
    required this.completed,
    required this.successRate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("This Week’s Performance",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat("${requests}", "Requests", Colors.purple),
              _buildStat("${completed}", "Completed", Colors.green),
              _buildStat("${(successRate * 100).toInt()}%", "Success Rate",
                  Colors.blue),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12))
      ],
    );
  }
}
