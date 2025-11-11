import 'package:call4help/presentation/providers/service_details_provider.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final ServiceDetailsProvider provider;

  const AboutSection({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "This service is provided by ${provider.service.name}. ${provider.service.about}",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: buildServicesOffer(),
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: buildWorkingHourCard(),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }

  Widget buildWorkingHourCard() {
    final List<Map<String, String>> workingHours = [
      {'day': 'Monday', 'time': '9:00 AM - 8:00 PM', 'isClosed': 'false'},
      {'day': 'Tuesday', 'time': '9:00 AM - 8:00 PM', 'isClosed': 'false'},
      {'day': 'Wednesday', 'time': '9:00 AM - 8:00 PM', 'isClosed': 'false'},
      {'day': 'Thursday', 'time': '9:00 AM - 8:00 PM', 'isClosed': 'false'},
      {'day': 'Friday', 'time': '9:00 AM - 8:00 PM', 'isClosed': 'false'},
      {'day': 'Saturday', 'time': '9:00 AM - 6:00 PM', 'isClosed': 'false'},
      {'day': 'Sunday', 'time': 'Closed', 'isClosed': 'true'},
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Wrap content height
        children: <Widget>[
          const Text(
            'Working Hours',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            itemCount: workingHours.length,
            itemBuilder: (context, index) {
              final day = workingHours[index]['day']!;
              final time = workingHours[index]['time']!;
              final isClosed = workingHours[index]['isClosed'] == 'true';
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      day,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54, // Lighter color for day names
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isClosed
                            ? FontWeight.normal
                            : FontWeight.w500,
                        color: isClosed ? Colors.red : Colors.black87,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildServicesOffer() {
    final List<Map<String, String>> services = const [
      {'title': 'Basic Service', 'subtitle': 'Standard quality work'},
      {
        'title': 'Premium Service',
        'subtitle': 'Enhanced quality with warranty',
      },
      {'title': 'Emergency Service', 'subtitle': '24/7 availability'},
      {'title': 'Consultation', 'subtitle': 'Expert advice'},
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Services Offered',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: services
                .map(
                  (service) => ServiceCard(
                    title: service['title']!,
                    subtitle: service['subtitle']!,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const ServiceCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        color: Color(0x0ff9fafb),
        constraints: const BoxConstraints(minHeight: 80),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
