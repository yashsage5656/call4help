import 'package:call4help/presentation/pages/provider/providers/earning_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderEarnings extends StatelessWidget {
  const ProviderEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EarningsProvider(),
      child: Consumer<EarningsProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: const PrimaryAppBar(title: "My Earnings"),
          backgroundColor: const Color(0xFFF5F5F5),
          body: Container(
            decoration: AppDecoration.gradientBackground,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TotalEarningsCard(provider: provider),
                const SizedBox(height: 24),
                const Text(
                  "Recent Earnings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.recentEarnings.length,
                    itemBuilder: (context, index) =>
                        _RecentEarningCard(item: provider.recentEarnings[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TotalEarningsCard extends StatelessWidget {
  final EarningsProvider provider;
  const _TotalEarningsCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    final infoItems = [
      {"label": "This Week", "value": "₹${provider.thisWeek}"},
      {"label": "This Month", "value": "₹${provider.thisMonth}"},
      {"label": "Jobs Done", "value": provider.jobsDone.toString()},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Total Earnings", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 8),
          Text(
            "₹${provider.totalEarnings.toStringAsFixed(0)}",
            style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: infoItems
                .map((item) => _InfoItem(label: item["label"]!, value: item["value"]!))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label, value;
  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
      const SizedBox(height: 4),
      Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
    ],
  );
}

class _RecentEarningCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const _RecentEarningCard({required this.item});

  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(item["icon"], color: Colors.green),
      ),
      title: Text(item["title"], style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(item["date"]),
      trailing: Text("₹${item["amount"]}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    ),
  );
}
