import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String responseTime;
  final bool isAvailable;

  const ServiceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.responseTime,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: 36,
              height: 36,
              fit: BoxFit.contain,
            ),            ),
          const SizedBox(width: 12),

          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isAvailable
                            ? Colors.green[100]
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        isAvailable ? "Available" : "Busy",
                        style: TextStyle(
                          color: isAvailable
                              ? Colors.green[800]
                              : Colors.red[800],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        size: 14, color: Colors.black),
                    const SizedBox(width: 4),
                    Text(
                      "Response time: $responseTime",
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Right arrow
          const Icon(Icons.arrow_forward,
              size: 24, color: Colors.redAccent),
        ],
      ),
    );
  }
}
