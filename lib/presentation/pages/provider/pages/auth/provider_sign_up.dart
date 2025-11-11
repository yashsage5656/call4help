import 'package:call4help/presentation/pages/provider/providers/vendor_sign_up_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ProviderSignUp extends StatelessWidget {
  const ProviderSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VendorSignUpProvider(),
      child: Consumer<VendorSignUpProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: Container(
              decoration: AppDecoration.gradientBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                      ),
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
                            padding: const EdgeInsets.only(
                              left: 70,
                              top: 110,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => provider.onBackTap(context),


                                  child: Row(
                                    children: const [
                                      Icon(
                                        Iconsax.arrow_left,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "Back",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Sign Up",
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
                  ),

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
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              const Text(
                                textAlign: TextAlign.center,
                                "Create New\n Account",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.14,
                              ),

                              buildTextField(
                                hintText: 'Enter your name',
                                label: 'Name',
                              ),
                              buildTextField(
                                hintText: 'Enter your email',
                                label: 'Email',
                              ),
                              buildTextField(
                                hintText: 'Enter your number',
                                label: 'Mobile No.',
                              ),
                              const SizedBox(height: 8),

                              GestureDetector(
                                onTap: ()=>provider.onSignUpTap(context),
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
                                      "Sign Up",
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
                              const Text(
                                textAlign: TextAlign.center,
                                "Already Registered? Login in here ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
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

  Widget buildTextField({required String hintText, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const SizedBox(height: 8),

        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Color(0xFFCA705F)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: TextField(
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
