import 'package:call4help/presentation/providers/welcome_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeProvider(),
      child: Scaffold(
        body: Container(
          decoration: AppDecoration.gradientBackground,
          padding: const EdgeInsets.all(16),
          child: Consumer<WelcomeProvider>(
            builder: (context, provider, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png", width: 200, height: 200),
                const SizedBox(height: 8),
                const Text(
                  "Call4Help",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "Connected with trusted service providers",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context,
                  icon: Icons.person,
                  title: "I need a service",
                  subtitle: "Find trusted providers",
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onTap: () => provider.onCustomerTap(context),
                ),
                _buildButton(
                  context,
                  icon: Icons.shopping_bag,
                  title: "I provide service",
                  subtitle: "Grow your business",
                  color: Colors.white,
                  textColor: Colors.black,
                  onTap: () => provider.onProviderTap(context),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Skip for now (Demo as Customer)",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required Color color,
        required Color textColor,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: textColor)),
                Text(subtitle, style: TextStyle(color: textColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
