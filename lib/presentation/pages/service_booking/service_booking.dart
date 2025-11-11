import 'package:call4help/presentation/providers/service_booking_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceBooking extends StatelessWidget {
  const ServiceBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => ServiceBookingProvider(),
      child: Consumer<ServiceBookingProvider>(
        builder: (context, p, _) => Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
            backgroundColor: Color(0xFF243b50),
            title: const Text(
              "Auto Care Center",
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

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  const SizedBox(height: 16),
                  _serviceType(p),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => p.onSelectDateTap(context),
                      child: Container(
                        width: width,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFF243b50),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Continue to Date & Time",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _header() => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      // color: Colors.white,

    ),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.car_repair, color: Colors.blue, size: 26),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Auto Care Center",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Car & Bike Repair",
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        "4.6 (234 reviews)",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 6),
                      _tag(
                        "150+ jobs",
                        Colors.green.shade100,
                        Colors.green.shade700,
                      ),
                      const SizedBox(width: 4),
                      _tag(
                        "Verified",
                        Colors.blue.shade100,
                        Colors.blue.shade700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _stat(Icons.timer, "Avg Response: 15 mins"),
                      const SizedBox(width: 10),
                      _stat(Icons.check_circle, "98% Completion Rate"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            _outlinedBtn(Icons.location_on_outlined, "View Location"),
          ],
        ),
      ],
    ),
  );

  Widget _stat(IconData i, String t) => Row(
    children: [
      Icon(i, size: 14, color: Colors.grey.shade600),
      const SizedBox(width: 4),
      Text(t, style: const TextStyle(fontSize: 12)),
    ],
  );

  Widget _outlinedBtn(IconData i, String l) => Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Icon(i, color: Colors.black, size: 18),
        label: Text(
          l,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        onPressed: () {},
      ),
    ),
  );

  Widget _serviceType(ServiceBookingProvider p) => Padding(
    padding: const EdgeInsets.all(8),
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Service Type",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 8),
          ...[
            ["Basic Service", "₹500", "Standard quality service"],
            ["Premium Service", "₹800", "Enhanced service with warranty"],
            ["Emergency Service", "₹1200", "Immediate assistance"],
          ].map(
            (e) => RadioListTile<String>(
              dense: true,
              activeColor: Colors.blue,
              contentPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Text(
                    e[0],
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 4),
                  Text(e[1], style: const TextStyle(color: Colors.black54)),
                ],
              ),
              subtitle: Text(e[2]),
              value: e[0],
              groupValue: p.selectedService,
              onChanged: (v) => p.selectService(v!),
            ),
          ),
          const Text(
            "Describe Your Requirement",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Write here...",
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const Divider(),
          _customPrice(p),
        ],
      ),
    ),
  );

  Widget _customPrice(ServiceBookingProvider p) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.blue.shade50.withOpacity(0.4),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.blue.shade100),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Set",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Checkbox(
              value: p.isCustomPrice,
              onChanged: p.toggleCustomPrice,
              activeColor: Colors.blue,
            ),
            const Text(
              "Custom Price (Bidding)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            _tag("Save Money", Colors.purple.shade100, Colors.purple.shade700),
            const SizedBox(width: 4),
            _tag("95% Success", Colors.green.shade100, Colors.green.shade700),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          "💡 Most customers save ₹50–200 with smart bidding!",
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _price(
                "Original Price",
                "₹${p.originalPrice}",
                Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _price("Your Offer", "₹${p.offerPrice}", Colors.purple),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "Enter Your Offer Amount",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.currency_rupee,
              color: Colors.grey,
              size: 18,
            ),
            suffixIcon: const Icon(Icons.edit, color: Colors.grey, size: 18),
            hintText: p.offerPrice.toString(),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: (v) => v.isNotEmpty
              ? p.updateOffer(double.tryParse(v) ?? p.offerPrice)
              : null,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "-10%|₹720",
            "-20%|₹640",
            "-30%|₹560",
          ].map((e) => _chip(e.split('|')[0], e.split('|')[1])).toList(),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.amber.shade200),
          ),
          child: const Text(
            "⭐ Pro Tip: Bids within 20% of original price get 90% acceptance rate!",
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    ),
  );

  Widget _price(String l, String v, Color c) => Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l, style: const TextStyle(color: Colors.black54, fontSize: 13)),
        const SizedBox(height: 4),
        Text(
          v,
          style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    ),
  );

  Widget _chip(String l, String p) => Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      "$l ($p)",
      style: const TextStyle(fontSize: 13, color: Colors.black87),
    ),
  );

  Widget _tag(String l, Color bg, Color t) => Container(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      l,
      style: TextStyle(color: t, fontWeight: FontWeight.w600, fontSize: 10),
    ),
  );
}
