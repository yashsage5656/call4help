import 'package:call4help/presentation/providers/select_payment_method_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SelectPaymentMethodProvider>(context);
    final methods = [
      {
        'title': 'UPI',
        'subtitle': 'Pay using UPI apps',
        'icon': Icons.account_balance_wallet_outlined,
      },
      {
        'title': 'Credit/Debit Card',
        'subtitle': 'Visa, Mastercard, etc.',
        'icon': Icons.credit_card,
      },
      {
        'title': 'Net Banking',
        'subtitle': 'All major banks',
        'icon': Icons.account_balance_outlined,
      },
      {
        'title': 'Cash on Delivery',
        'subtitle': 'Pay after service',
        'icon': Icons.attach_money,
      },
      {
        'title': 'EMI',
        'subtitle': 'Easy monthly installments',
        'icon': Icons.payments_outlined,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choose Payment Method",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Column(
            children: List.generate(methods.length, (index) {
              final method = methods[index];
              final selected = provider.selectedPaymentIndex == index;
              return InkWell(
                onTap: () => provider.selectPaymentMethod(index),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: selected ? Colors.deepPurple[50] : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:
                      selected ? Colors.deepPurple : Colors.grey.shade300,
                      width: selected ? 1.5 : 1,
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(method['icon'] as IconData,
                        color:
                        selected ? Colors.deepPurple : Colors.grey[700]),
                    title: Text(method['title'] as String,
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(method['subtitle'] as String),
                    trailing: Radio<int>(
                      value: index,
                      groupValue: provider.selectedPaymentIndex,
                      activeColor: Colors.deepPurple,
                      onChanged: (_) => provider.selectPaymentMethod(index),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
