import 'package:call4help/presentation/pages/provider/providers/set_up_profile_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetUpProfile extends StatelessWidget {
  const SetUpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SetUpProfileProvider(),
      child: Consumer<SetUpProfileProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: const Text(
                "Setup Your Profile",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFF243b50),
              elevation: 0,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: AppDecoration.gradientBackground,
              child: SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints
                              .maxHeight, // ✅ Forces gradient to stretch fully
                        ),
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Tell us about your business",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Align(
                                        alignment: Alignment.center,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage: NetworkImage(
                                            'https://microbiology.ucr.edu/sites/default/files/styles/form_preview/public/blank-profile-pic.png?itok=4teBBoet',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.center,
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            "Upload Photo/Logo",
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      buildTextField(
                                        hintText: "Enter your name",
                                        label: "Your Name*",
                                      ),
                                      buildTextField(
                                        hintText: "Enter business name",
                                        label: "Business Name*",
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Service Type*",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      buildServiceType(provider: provider),
                                      buildTextField(
                                        hintText: "Enter your city",
                                        label: "City*",
                                      ),
                                      const SizedBox(height: 12),
                                      PrimaryButton(
                                        onPressed: ()=>provider.onCompleteSetUpTap(context),
                                        title: "Complete Setup",
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const SizedBox(height: 20),
                                const Text(
                                  "By continuing, you agree to our Terms of Service",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(18),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter value',
            ),
          ),
        ),
      ],
    );
  }

  Widget buildServiceType({required SetUpProfileProvider provider}) {
    return DropdownButtonFormField<String>(
      value: provider.selectedServiceType,
      hint: const Text("Select Service Type"),
      items: provider.serviceTypes
          .map((type) => DropdownMenuItem(value: type, child: Text(type)))
          .toList(),
      onChanged: provider.selectService,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade400,
      ),
    );
  }
}
