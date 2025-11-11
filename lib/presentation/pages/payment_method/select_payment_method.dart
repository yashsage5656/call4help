import 'package:call4help/presentation/pages/payment_method/payment_section.dart';
import 'package:call4help/presentation/providers/select_payment_method_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectPaymentMethod extends StatelessWidget {
  const SelectPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectPaymentMethodProvider(),
      child: Consumer<SelectPaymentMethodProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor:      Color(0xFF243b50),

              elevation: 0,
              foregroundColor: Colors.white,
              title: const Text(
                "Payment Method",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),

            body: SingleChildScrollView(
              child: Container(
                decoration: AppDecoration.gradientBackground,

                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildSummaryCard(),
                    const SizedBox(height: 20),
                    const PaymentMethodSection(),
                    const SizedBox(height: 20),
                    buildPaymentButton(context: context, provider: provider),
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

Widget _buildSummaryCard() {
  return Card(
    color: Colors.white,

    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Booking Summary",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          _buildRow("Service", "Premium Service"),
          _buildRow("Date & Time", "2025-10-14 at 5:00 PM"),
          _buildRow("Provider", "Ram Bike Mechanics"),
          const Divider(height: 24),
          _buildRow(
            "Total Amount",
            "₹800",
            isBold: true,
            color: Colors.deepPurple,
          ),
        ],
      ),
    ),
  );
}

Widget _buildRow(
  String title,
  String value, {
  bool isBold = false,
  Color? color,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color ?? Colors.black,
          ),
        ),
      ],
    ),
  );
}



Widget buildPaymentButton({
  required BuildContext context,
  required SelectPaymentMethodProvider provider,
}) {
  return InkWell(
    onTap: () => provider.onConfirmAndPayTap(context),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:      Color(0xFF243b50),

        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        "Confirm & Pay",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}
