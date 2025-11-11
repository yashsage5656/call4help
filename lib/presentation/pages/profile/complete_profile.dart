import 'package:call4help/presentation/providers/complete_profile_provider.dart';
import 'package:call4help/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CompleteProfileProvider(),
      child: Consumer<CompleteProfileProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor:                  Color(0xFf64748b),

            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    spacing: 8,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Complete Your Profile",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Tell us a bit about yourself",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      buildTextField(
                        hintText: "Enter your full name",
                        labelText: "Name *",
                      ),
                      buildTextField(
                        hintText: "Enter your city",
                        labelText: "City *",
                      ),
                      buildTextField(
                        hintText: "Enter your email",
                        labelText: "Email (Optional)",
                      ),
                      PrimaryButton(
                        color: Color(0xFfca705f),

                        onPressed: () => provider.onCompleteProfileTap(context),
                        title: "Complete Setup",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTextField({required String hintText, required String labelText}) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          labelText,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            maxLength: 6,
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
