import 'package:call4help/presentation/providers/service_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/service_provider_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServiceProvider(),
      child: Consumer<ServiceProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(CupertinoIcons.back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),

              title: Row(
                children: [
                  Image.asset("assets/search.png", width: 20, height: 20),
                  const SizedBox(width: 8),
                  const Text("Services", style: TextStyle(color: Colors.white)),
                ],
              ),
              backgroundColor: Color( 0xFF243b50),

              elevation: 0,
            ),
            body: Container(
              decoration: AppDecoration.gradientBackground,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    buildSearchBar(),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        buildFilterCard(title: "Near me"),
                        buildFilterCard(title: "Top Rated"),
                        buildFilterCard(title: "Verified"),
                        buildFilterCard(title: "Budget Friendly"),
                      ],
                    ),
                    Text("3 Providers found"),
                    ProviderCard(
                      provider: provider,
                      onTap: () => provider.onServiceTap(context),
                      name: "Sharma Coaching",
                      subtitle: "IIT-JEE & NEET Preparation",
                      price: "₹2000",
                      experience: "8 years",
                      rating: "4.8",
                      reviews: "120",
                      location: "Indore",
                    ),

                    ProviderCard(
                      provider: provider,
                      onTap: () => provider.onServiceTap(context),
                      name: "Sharma Coaching",
                      subtitle: "IIT-JEE & NEET Preparation",
                      price: "₹2000",
                      experience: "8 years",
                      rating: "4.8",
                      reviews: "120",
                      location: "Indore",
                    ),

                    ProviderCard(
                      provider: provider,
                      onTap: () => provider.onServiceTap(context),
                      name: "Sharma Coaching",
                      subtitle: "IIT-JEE & NEET Preparation",
                      price: "₹2000",
                      experience: "8 years",
                      rating: "4.8",
                      reviews: "120",
                      location: "Indore",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildFilterCard({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(title),
    );
  }

  Widget buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search providers...',
                border: InputBorder.none,
                counterText: '',
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.filter_alt, color: Colors.black54),
        ),
      ],
    );
  }
}
