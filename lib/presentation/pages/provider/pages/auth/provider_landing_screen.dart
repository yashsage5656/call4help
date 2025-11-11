import 'package:call4help/presentation/pages/provider/providers/vendor_landing_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderLandingScreen extends StatelessWidget {
  const ProviderLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VendorLandingProvider(),
      child: Consumer<VendorLandingProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: Container(
              decoration:AppDecoration.gradientBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Stack(
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        // width: 140,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        "assets/14-removebg-preview.png",
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Please Sign in to continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF243b50),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF243b50),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36.0,
                          vertical: 18,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => provider.onLoginTap(context),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFFCA705F),
                                    width: 2,
                                  ),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: const Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            GestureDetector(
                              onTap: () => provider.onSignUpTap(context),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFFCA705F),
                                    width: 2,
                                  ),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: const Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // ✅ Terms & Privacy using RichText
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
