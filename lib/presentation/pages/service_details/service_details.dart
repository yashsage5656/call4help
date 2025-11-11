import 'package:call4help/presentation/pages/service_details/about_section.dart';
import 'package:call4help/presentation/pages/service_details/review_section.dart';
import 'package:call4help/presentation/providers/service_details_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServiceDetailsProvider(),
      child: Consumer<ServiceDetailsProvider>(
        builder: (context, provider, _) => DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Color(0xffF9FAFB),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(CupertinoIcons.back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                "Service Details",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: Color(0xFF243b50),
              elevation: 0,
              centerTitle: true,
              actions: const [
                Icon(Icons.favorite_border, color: Colors.white),
                SizedBox(width: 10),
              ],
            ),
            body: Container(
              decoration: AppDecoration.gradientBackground,

              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --- Top Section ---
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.pedal_bike, size: 30),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.service.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      provider.service.category,
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber[700],
                                          size: 18,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "${provider.service.rating} (${provider.service.reviewsCount} reviews)",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.location_on_outlined,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        Flexible(
                                          child: Text(
                                            provider.service.location,
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    provider.service.priceRange,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Icon(
                                    Icons.circle,
                                    size: 4,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${provider.service.experience} years",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),
                          Row(
                            spacing: 8,
                            children: [
                              _buildTag(Icons.verified, "Verified Provider"),
                              _buildTag(Icons.flash_on, "Quick Response"),
                              _buildTag(Icons.star, "Top Rated"),
                            ],
                          ),
                          const SizedBox(height: 16),

                              PrimaryButton(
                                color: Color(0xFF243b50),

                                onPressed: () =>
                                    provider.onBookServiceTap(context),

                                title: "Book Service",
                              ),

                          const SizedBox(height: 16),
                          const TabBar(
                            indicatorColor: Colors.blue,
                            labelColor: Colors.blue,

                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(text: "About"),
                              Tab(text: "Reviews"),
                              Tab(text: "Gallery"),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: TabBarView(
                              children: [
                                AboutSection(provider: provider),
                                ReviewsSection(),
                                Center(child: Text("Gallery content")),
                              ],
                            ),
                          ),
                        ],
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


  static Widget _buildTag(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 16),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
