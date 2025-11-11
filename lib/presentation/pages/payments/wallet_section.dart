import 'package:call4help/presentation/providers/payment_and_wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentAndWalletProvider(),
      child: Consumer<PaymentAndWalletProvider>(
        builder: (context, provider, _) {
          return Column(
            spacing: 12,
            children: [
              Container(
                // height: 300,
                // margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                        color: Color(0xFF243b50),


                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Call4Help Wallet",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Available Balance",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "₹${provider.balance.toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => provider.addMoney(100),
                        icon: const Icon(Icons.add, color: Color(0xFF2962FF)),
                        label: const Text(
                          "Add Money",
                          style: TextStyle(color: Color(0xFF2962FF)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "1350",
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            "Total Spent",
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                   color: Colors.grey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "3",
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            "Total Spent",
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                   color: Colors.grey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wallet Benefits",
                        style: Theme.of(context).textTheme.bodyLarge
                            ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height:20),

                      Row(
                        spacing: 8,
                        children: [
                          Icon(Icons.check,color: Colors.green,),
                          Text(
                            "Instant Payments- no waiting time",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Icon(Icons.check,color: Colors.green,),
                          Text(
                            "Instant Payments- no waiting time",
                            style: Theme.of(context).textTheme.labelLarge,

                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Icon(Icons.check,color: Colors.green,),
                          Text(
                            "Easy refunds and cancellations",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Icon(Icons.check,color: Colors.green,),
                          Text(
                            "Exclusive wallet offers and cashback",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
