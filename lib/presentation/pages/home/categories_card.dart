import 'package:call4help/presentation/pages/home/card_helper.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/material.dart';
import 'package:call4help/presentation/providers/home_provider.dart';

class CategoriesCard extends StatefulWidget {
  final HomeProvider provider;

  const CategoriesCard({super.key, required this.provider});

  @override
  State<CategoriesCard> createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    final total = widget.provider.categories.length;

    // Each card will slightly "float" up and down at different timings
    _slideAnimations = List.generate(total, (i) {
      final start = (i * 0.1).clamp(0.0, 1.0);
      final end = (start + 0.8).clamp(0.0, 1.0);
      return Tween<Offset>(
        begin: const Offset(0, 0.05),
        end: const Offset(0, -0.05),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = widget.provider;

    return Container(
      decoration: AppDecoration.gradientBackground,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Top Categories",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text("See All", style: TextStyle(color: Colors.white70)),
            ],
          ),

          // Animated grid
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: provider.categories.length,
            itemBuilder: (context, index) {
              final c = provider.categories[index];

              return SlideTransition(
                position: _slideAnimations[index],
                child: InkWell(
                  onTap: () {
                    if (index == 0) {
                      provider.onEmergencyTap(context);
                    } else {
                      provider.onServicesTap(context);
                    }
                  },
                  child: CardHelper(
                    title: c["title"] as String,
                    sub: c["sub"] as String,
                    icon: c["icon"] as String,
                    align: CrossAxisAlignment.center,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
