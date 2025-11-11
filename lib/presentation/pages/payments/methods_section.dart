import 'package:call4help/presentation/providers/payment_and_wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MethodsSection extends StatelessWidget {
  const MethodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentAndWalletProvider(),
      child: Consumer<PaymentAndWalletProvider>(
        builder: (context, provider, _) =>
          // backgroundColor: Colors.grey[50],
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Saved Cards Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Saved Cards",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text("Add Card"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...provider.savedCards.map((card) => _buildCardTile(card)),

                const SizedBox(height: 24),

                // 🔹 Other Methods Section
                const Text(
                  "Other Methods",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ...provider.otherMethods.map(
                  (method) => _buildMethodTile(method),
                ),
              ],
            ),
          ),
        ),
    );
  }

  // 🔸 Card Item
  Widget _buildCardTile(Map<String, dynamic> card) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: List<Color>.from(card['gradient']),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.credit_card, color: Colors.white),
        ),
        title: Text(
          "${card['type']} •••• ${card['number']}",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text("Expires ${card['expiry']}"),
        trailing:Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
                if (card['isDefault'])
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Default",
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                const Text(
                  "Edit",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                ),
          ],
        )
      ),
    );
  }
  Widget _buildMethodTile(Map<String, dynamic> method) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: Icon(method['icon'], color: Colors.black),
        ),
        title: Text(
          method['title'],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(method['subtitle']),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            method['status'],
            style: const TextStyle(color: Colors.green, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
