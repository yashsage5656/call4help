import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const RequestCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isUrgent = item["type"] == "Urgent";
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6,),
      padding: const EdgeInsets.all(14),
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
          // Name + Badge + Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(item["name"],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(width: 6),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: isUrgent
                          ? Colors.red.withOpacity(0.15)
                          : Colors.blue.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      item["type"],
                      style: TextStyle(
                        fontSize: 12,
                        color: isUrgent ? Colors.red : Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              Text("₹${item["price"]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 4),
          Text(item["service"],
              style:
              const TextStyle(fontSize: 14, color: Colors.black54)),
          const SizedBox(height: 4),
          Text("${item["location"]} • ${item["time"]}",
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    side: const BorderSide(color: Colors.grey)),
                child: const Text("Decline"),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF243b50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Accept",style: TextStyle(color: Colors.white),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
