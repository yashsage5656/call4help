import 'package:call4help/presentation/providers/login_with_phone_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class LoginWithPhone extends StatelessWidget {
  const LoginWithPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginWithPhoneProvider(),
      child: Scaffold(
        body: Container(
          decoration: AppDecoration.gradientBackground,
          child: Consumer<LoginWithPhoneProvider>(
            builder: (context, provider, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTopSection(context, provider),
                const SizedBox(height: 40),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF243b50),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Sign in to continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                          _buildTextField(label: 'Mobile No.', hint: 'Enter your number'),
                          const SizedBox(height: 12),
                          _buildButton(
                            title: "Continue",
                            onTap: () => provider.onSendOtpTap(context),
                          ),
                          const SizedBox(height: 36),
                          _buildGoogleButton(),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () => provider.onSignUpTap(context),
                            child: const Text(
                              "Don't have an account? Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context, LoginWithPhoneProvider provider) {
    return Stack(
      children: [
        Container(height: 180, width: double.infinity),
        Positioned(
          top: -60,
          left: -60,
          child: Container(
            height: 220,
            width: 220,
            decoration: const BoxDecoration(
              color: Color(0xFF243b50),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 70, top: 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => provider.onBackTap(context),
                    child: const Icon(Iconsax.arrow_left, color: Colors.white, size: 30),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xff768591),
            border: Border.all(color: const Color(0xFFCA705F)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xff768591),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFCA705F)),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildGoogleButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFCA705F)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/google.png", width: 28, height: 28),
            const SizedBox(width: 8),
            const Text(
              "Continue With Google",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
