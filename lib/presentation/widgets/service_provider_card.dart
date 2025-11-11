import 'package:call4help/presentation/providers/service_provider.dart';
import 'package:flutter/material.dart';

class ProviderCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String price;
  final String experience;
  final String rating;
  final String reviews;
  final String location;
  final String? image;
  final VoidCallback onTap;
  final ServiceProvider provider;

  const ProviderCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.experience,
    required this.rating,
    required this.reviews,
    required this.onTap,
    required this.location,
    required this.provider,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Color(0xFFE1E6EB),
        elevation: 1.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(image ?? 'assets/profile_placeholder.jpg'),
            ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              price,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '/month',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),

                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              subtitle,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              experience,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(
                    rating,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " ($reviews reviews)",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.grey, size: 16),
                  Text(location, style: const TextStyle(color: Colors.grey)),
                  const Spacer(),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => provider.onServiceTap(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF243b50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        "Book",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
