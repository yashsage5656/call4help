import 'package:call4help/presentation/pages/dashboard/welcome_card.dart';
import 'package:call4help/presentation/pages/provider/pages/provider_dashboard/performance_card.dart';
import 'package:call4help/presentation/pages/provider/pages/provider_dashboard/request_card.dart';
import 'package:call4help/presentation/pages/provider/providers/vendor_dashboard_provider.dart';
import 'package:call4help/presentation/providers/dashboard_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/dashboard_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDashboard extends StatelessWidget {
  const ProviderDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VendorDashboardProvider(),
      child: Consumer<VendorDashboardProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: buildCustomAppBar(context: context),
          body: Container(
            decoration: AppDecoration.gradientBackground,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeCard(provider: DashboardProvider()),
                  const SizedBox(height: 8),
                  _buildStatRow(context, [
                    _StatData(
                      title: "Total Earnings",
                      value: "₹${provider.totalEarnings.toStringAsFixed(0)}",
                      change: "+${provider.totalEarningsChange}%",
                      changeColor: Colors.green,
                    ),
                    _StatData(
                      title: "This Month",
                      value: "₹${provider.thisMonthEarnings.toStringAsFixed(0)}",
                      change: "+${provider.thisMonthChange}%",
                      changeColor: Colors.green,
                    ),
                  ]),
                  const SizedBox(height: 8),
                  _buildStatRow(context, [
                    _StatData(
                      title: "Completed",
                      value: provider.completed.toString(),
                      change: "+${provider.completedChange}",
                      changeColor: Colors.blue,
                    ),
                    _StatData(
                      title: "Rating",
                      value: provider.rating.toString(),
                      icon: const Icon(Icons.star, color: Colors.amber, size: 20),
                    ),
                  ]),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Recent Order's",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("See All"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ...provider.requests.map((item) => RequestCard(item: item)),
                  const SizedBox(height: 6),
                  PerformanceCard(
                    requests: provider.totalRequests,
                    completed: provider.completed,
                    successRate: provider.successRate,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(BuildContext context, List<_StatData> stats) {
    return Row(
      children: [
        for (var i = 0; i < stats.length; i++) ...[
          _buildStatCard(context, stats[i]),
          if (i != stats.length - 1) const SizedBox(width: 8),
        ]
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, _StatData data) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                if (data.icon != null) data.icon!,
                if (data.change != null)
                  Text(
                    data.change!,
                    style: TextStyle(color: data.changeColor ?? Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatData {
  final String title;
  final String value;
  final String? change;
  final Color? changeColor;
  final Icon? icon;

  _StatData({required this.title, required this.value, this.change, this.changeColor, this.icon});
}
