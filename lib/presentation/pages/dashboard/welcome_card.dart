import 'package:call4help/presentation/providers/dashboard_provider.dart';
import 'package:call4help/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  final DashboardProvider provider;

  const WelcomeCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFF243b50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hello, Yash! 👋",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Manage your services and grow your business",
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          const SizedBox(height: 10),
          PrimaryButton(

            width: 180,
            onPressed: () => provider.onEmergencyHelpTap(context),
            // icon: Icons.info_outline,
            title: "View Analytics",textColor: Colors.black,
            color: Color(0xFFFFFFFF),
          ),
        ],
      ),
    );
  }
}
