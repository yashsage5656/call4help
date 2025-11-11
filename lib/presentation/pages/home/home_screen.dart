import 'package:call4help/presentation/pages/home/categories_card.dart';
import 'package:call4help/presentation/pages/home/home_header.dart';
import 'package:call4help/presentation/pages/home/home_offers.dart';
import 'package:call4help/presentation/pages/home/home_recommended_section.dart';
import 'package:call4help/presentation/pages/home/home_top_services.dart';
import 'package:call4help/presentation/providers/home_provider.dart';
import 'package:call4help/presentation/widgets/notification_dialog.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return Scaffold(

            appBar: AppBar(
              scrolledUnderElevation: 0,

              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF243b50),
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: const AssetImage("assets/images/user.jpg"),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "HELLO, JACQUELINE!",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => NotificationPopup.toggle(context),

                    child: const Icon(
                      Iconsax.notification,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/track_booking');
                    },
                    child: const Icon(Iconsax.location, color: Colors.white),
                  ),
                ],
              ),
            ),
              backgroundColor: Colors.grey.shade200,
            body: SingleChildScrollView(

              child: Column(
                children: [
                  HomeHeader(),
                  HomeOffers(),
                  HomeTopServices(),
                  CategoriesCard(provider: provider),
                  HomeRecommendedSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
