import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/service_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmergencyHelp extends StatelessWidget {
  const EmergencyHelp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget quickAction({
      required IconData icon,
      required String text,
      Color? color,
      bool filled = false,
    }) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: filled ? Colors.red : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: filled ? null : Border.all(color: Colors.red),
          ),
          child: Column(
            children: [
              Icon(icon, color: filled ? Colors.white : Colors.red),
              Text(
                text,
                style: TextStyle(color: filled ? Colors.white : Colors.red),
              ),
            ],
          ),
        ),
      );
    }

    Widget safetyTips = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:  Colors.grey.shade400,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Safety Tips",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          ...[
            "Share your location with trusted contacts",
            "Keep emergency contacts handy",
            "Verify provider identity before service",
            "Use in-app payment for security",
          ].map(
            (tip) => Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text("• $tip", style: TextStyle(color: Colors.blue)),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF243b50),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/danger.png",
              width: 20,
              height: 20,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            const Text(
              "Emergency Help",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(8),
        child: Container(
          decoration: AppDecoration.gradientBackground,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(color: Color(0xffFEF2F2)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(width: 4, color: Colors.red),
                    const SizedBox(width: 12),
                    Image.asset(
                      "assets/danger.png",
                      width: 28,
                      height: 28,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Need Immediate Help?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffAD113B),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Our emergency services are available 24/7",
                          style: TextStyle(color: Color(0xffAD113B)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
             Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    spacing: 24,
                    children: [
                      Row(
                        spacing: 8,
                        children: const [
                          Icon(CupertinoIcons.shield, color: Colors.red),
                          Text(
                            "Quick Actions",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          quickAction(
                            icon: CupertinoIcons.phone,
                            text: "Emergency Call",
                            filled: true,
                          ),
                          quickAction(
                            icon: Icons.messenger_outline,
                            text: "Live Chat",
                          ),
                        ],
                      ),
                    ],
                  ),

              ),
              const ServiceCard(
                imagePath: "assets/siren.png",
                title: "Emergency Services",
                subtitle: "24/7 Emergency Response",
                responseTime: "5–10 mins",
                isAvailable: true,
              ),
              const ServiceCard(
                imagePath: "assets/settings.png",
                title: "Emergency Mechanic",
                subtitle: "Car/Bike breakdown assistance",
                responseTime: "5–10 mins",
                isAvailable: true,
              ),
              const ServiceCard(
                imagePath: "assets/house.png",
                title: "Emergency Home Services",
                subtitle: "Urgent plumbing,electrical repairs",
                responseTime: "20–30 mins",
                isAvailable: true,
              ),
              const ServiceCard(
                imagePath: "assets/monitor.png",
                title: "Urgent IT Support",
                subtitle: "Computer/Internet emergency",
                responseTime: "20–30 mins",
                isAvailable: true,
              ),
              const ServiceCard(
                imagePath: "assets/book.png",
                title: "Emergency Tutoring",
                subtitle: "Last-minute exam help",
                responseTime: "20–30 mins",
                isAvailable: true,
              ),
              const ServiceCard(
                imagePath: "assets/office-building.png",
                title: "Property Emergency",
                subtitle: "Urgent property assistance",
                responseTime: "20–30 mins",
                isAvailable: true,
              ),
              safetyTips,
            ],
          ),
        ),
      ),
    );
  }
}
