import 'package:call4help/presentation/providers/walkthrough_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalkthroughScreen extends StatelessWidget {
  const WalkthroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    final walkthroughPages = [
      {
        "title": "Find Service Easily",
        "subtitle":
        "Connected with trusted service providers across Indore, Bhopal and nearby cities",
        "icon": CupertinoIcons.search,
        "color": Colors.blue, // Color for first icon


      },
      {
        "title": "Verified providers",
        "subtitle": "All service providers are background verified with genuine customer reviews",
        "icon": CupertinoIcons.shield,
        "color": Colors.green, // Color for first icon

      },
      {
        "title": "Emergency Support",
        "subtitle": "Get immediate help with our 24/7 emergency service network",
        "icon": CupertinoIcons.clock,
        "color": Colors.purple, },

    ];

    return ChangeNotifierProvider(
      create: (_) => WalkthroughProvider(),
      child: Consumer<WalkthroughProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: Color(0xffF9FAFB),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: walkthroughPages.length,
                      onPageChanged: provider.setPage,
                      itemBuilder: (context, index) {
                        final page = walkthroughPages[index];
                        return Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                page["icon"] as IconData,
                                size: 80,
                                color: page["color"] as Color,
                              ),
                              const SizedBox(height: 40),
                              Text(
                                page["title"] as String,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                page["subtitle"] as String,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      walkthroughPages.length,
                          (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: provider.currentPage == index ? 8 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: provider.currentPage == index
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => provider.onSkipTap(context),
                          child: const Text("Skip"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFfca705f),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),

                          onPressed: () {
                            if (provider.currentPage ==
                                walkthroughPages.length - 1) {
                              provider.onGetStartedTap(context);
                            } else {
                              provider.nextPage(
                                  pageController, walkthroughPages.length);
                            }
                          },
                          child: Text(provider.currentPage ==
                              walkthroughPages.length - 1
                              ? "Get Started"
                              : "Next",
                            style: const TextStyle(color: Colors.white),
                        ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
