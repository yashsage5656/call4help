import 'package:call4help/presentation/pages/provider/providers/vendor_phone_login_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ProviderPhoneLogin extends StatelessWidget {
  const ProviderPhoneLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VendorPhoneLoginProvider(),
      child: Consumer<VendorPhoneLoginProvider>(
        builder: (context, provider, _) => Scaffold(
          body: Container(
            decoration: AppDecoration.gradientBackground,
            child: Column(
              children: [
                _Header(provider: provider),
                Expanded(child: _LoginForm(provider: provider)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VendorPhoneLoginProvider provider;
  const _Header({required this.provider});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: 180, width: double.infinity),
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
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginForm extends StatelessWidget {
  final VendorPhoneLoginProvider provider;
  const _LoginForm({required this.provider});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.18;

    return Container(
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
              "Provider Login",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const Text(
              "Sign in to continue",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: height),
            _CustomTextField(hintText: 'Enter your number', label: 'Mobile No.'),
            const SizedBox(height: 8),
            _CustomButton(
              text: "Continue",
              onTap: () => provider.onSendOtpTap(context),
            ),
            const SizedBox(height: 36),
            _GoogleButton(),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => provider.onSignUpTap(context),
              child: const Text(
                "Don't have an account? Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String hintText, label;
  const _CustomTextField({required this.hintText, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xff768591),
            border: Border.all(color: const Color(0xFFCA705F)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: TextField(
            decoration: InputDecoration(counterText: '', border: InputBorder.none, hintText: hintText),
          ),
        ),
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _CustomButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff768591),
          border: Border.all(color: const Color(0xFFCA705F)),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

class _GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFCA705F)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/google.png", width: 28, height: 28, fit: BoxFit.contain),
          const SizedBox(width: 8),
          const Text(
            "Continue With Google",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
