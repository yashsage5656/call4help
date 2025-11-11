import 'package:call4help/presentation/pages/payments/history_section.dart';
import 'package:call4help/presentation/pages/payments/methods_section.dart';
import 'package:call4help/presentation/pages/payments/wallet_section.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentsAndWallet extends StatelessWidget {
  const PaymentsAndWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "Payments and Wallet"),
      body: Container(
        decoration: AppDecoration.gradientBackground,
        child: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              spacing: 8,
              children: [
                _TabBarSection(activeCount: 2, historyCount: 2),
                Expanded(
                  child: TabBarView(
                    children: [
                      WalletSection(),
                      HistorySection(),
                      MethodsSection(),
                    ],
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

class _TabBarSection extends StatelessWidget {
  final int activeCount;
  final int historyCount;

  const _TabBarSection({required this.activeCount, required this.historyCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffECECF0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        tabs: [
          Tab(text: 'Wallet'),
          Tab(text: 'History'),
          Tab(text: 'Methods'),
        ],
      ),
    );
  }
}
