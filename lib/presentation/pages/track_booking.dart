import 'package:call4help/presentation/providers/track_booking_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class TrackBooking extends StatelessWidget {
  const TrackBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TrackBookingProvider(),
      child: Consumer<TrackBookingProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF243b50),
              title: const Text("Track Booking"),
              centerTitle: true,
            ),
            body: Container(
              decoration: AppDecoration.gradientBackground,
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  children: [
                    _BookingCard(provider: provider),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        "assets/images/track_booking_map.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.clock),
                        SizedBox(width: 6),
                        Text("Arriving in 20 minutes"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final TrackBookingProvider provider;
  const _BookingCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    const greyText = TextStyle(color: Colors.grey, fontSize: 13);

    return Container(
      width: double.infinity,
      decoration: _cardDecoration,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topRow(),
          const SizedBox(height: 8),
          _pinAndContactRow(),
          const SizedBox(height: 16),
          _profileAndStatus(),
          const SizedBox(height: 16),
          _timeAndPrice(),
          const SizedBox(height: 10),
          const Text(
            "Aarif Husain, Chacha Chai Zakir hotl k samne Tanzeem Nagar khajrana indore",
            style: greyText,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: ["Cooking", "Dessert", "5 Days", "4 People"]
                .map((e) => Chip(
              label: Text(e),
              backgroundColor: Colors.orange.shade50,
            ))
                .toList(),
          ),
          const SizedBox(height: 12),
          const Text(
            "This is the service description can write here which will be five line long",
            style: TextStyle(fontSize: 13.5, height: 1.4),
          ),
          const SizedBox(height: 14),
          Center(
            child: ElevatedButton.icon(
              onPressed: provider.isCancelled ? null : provider.cancelService,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade100,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              icon: const Icon(Icons.close),
              label: Text(provider.isCancelled
                  ? "Service Cancelled"
                  : "Cancel the service"),
            ),
          ),
        ],
      ),
    );
  }

  Row _topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Home > Cleaning", style: TextStyle(color: Colors.grey)),
        Text("Dec 07, 2025", style: TextStyle(color: Colors.grey.shade600)),
      ],
    );
  }

  Row _pinAndContactRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _sosBadge(),
            const SizedBox(width: 8),
            const Text("PIN - 7946",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            _circleIcon(Iconsax.call),
            const SizedBox(width: 8),
            _circleIcon(Iconsax.message),
          ],
        ),
      ],
    );
  }

  Row _profileAndStatus() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage('assets/profile.jpg'),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("John Smith",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text("4.8", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.blue, size: 16),
              SizedBox(width: 4),
              Text(
                "Confirmed",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _timeAndPrice() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Iconsax.clock, size: 18),
            SizedBox(width: 4),
            Text("4 Hour", style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
        Text(
          "₹ 450.00",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _sosBadge() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Text("SOS",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold)),
  );

  Widget _circleIcon(IconData icon) => CircleAvatar(
    radius: 18,
    backgroundColor: Colors.orange.withOpacity(0.1),
    child: Icon(icon, color: Colors.orange, size: 20),
  );
}

final _cardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 6,
      offset: const Offset(0, 3),
    ),
  ],
);
