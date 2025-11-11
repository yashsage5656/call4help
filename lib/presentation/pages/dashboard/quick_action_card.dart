import 'package:call4help/presentation/pages/home/card_helper.dart';
import 'package:call4help/presentation/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';

class QuickActionCard extends StatelessWidget {
  final DashboardProvider provider;
  const QuickActionCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        InkWell(
          onTap: () => provider.onRecentActivityTap(context),
          child: CardHelper(
            color: Colors.white,
            title: "My Bookings",
            sub: "View active services",
            icon: "assets/calendar.png",
            align: CrossAxisAlignment.center,
          ),
        ),
        InkWell(
          onTap: () => provider.onPaymentsTap(context),
          child: CardHelper(
            color: Colors.white,
            align: CrossAxisAlignment.center,
            title: "Payments",
            sub: "Wallet & history",
            icon: "assets/credit-card.png",
          ),
        ),
      ],
    );
  }
}
