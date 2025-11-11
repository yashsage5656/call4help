import 'package:call4help/presentation/providers/profile_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: Consumer<ProfileProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: PrimaryAppBar(title: "Profile"),
            body: SingleChildScrollView(
              child: Container(
                decoration: AppDecoration.gradientBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/user.jpg"),
                    ),
                    Text(
                      provider.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(provider.email, style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          ...[
                            _buildMenuItem(
                              Icons.person,
                              "Edit Profile",
                              "Manage your profile",
                            ),
                            Divider(color: Colors.white),
                            _buildMenuItem(
                              Icons.account_balance_wallet,
                              "Payments & Wallet",
                              "Manage payment methods",
                            ),
                            Divider(),
                            _buildMenuItem(
                              Icons.favorite_border,
                              "Saved Providers",
                              "Your favorite services",
                            ),
                            Divider(),
                            _buildMenuItem(
                              Icons.settings,
                              "Settings",
                              "Account & Preferences",
                            ),
                            Divider(),
                            _buildMenuItem(
                              Icons.language,
                              "Language",
                              "English",
                            ),
                            Divider(),
                            _buildMenuItem(
                              Icons.star,
                              "Rate App",
                              "Share your feedback",
                            ),
                            Divider(),
                            _buildMenuItem(
                              Icons.share,
                              "Share App",
                              "Invite friends",
                            ),
                            Divider(),
                            InkWell(
                              onTap: () =>
                                  provider.onBecomeProviderTap(context),
                              child: Container(
                                child: _buildMenuItem(
                                  Icons.shopping_bag_outlined,
                                  "Become a Provider",
                                  "Start earning with us",
                                ),
                              ),
                            ),
                            Divider(),
                            _buildMenuItem(
                              Icons.notifications,
                              "Push Notifications",
                              "Get update about your bookings",
                              trailing: Switch(
                                activeColor: Colors.white,
                                activeTrackColor: Colors.black,
                                value: true,
                                onChanged: (val) {},
                              ),
                            ),
                            Divider(),
                            InkWell(
                              onTap: () => provider.onLogOutTap(context),

                              child: _buildMenuItem(
                                Icons.logout,
                                "Logout",
                                "",
                                leadingColor: Colors.red,
                                trailing: SizedBox(),
                              ),
                            ),
                          ],
                          Center(child: Text("Call4Help v1.0.0")),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuItem(
    IconData? icon,
    String title,
    String subtitle, {
    Widget? trailing,
    Color? leadingColor,
  }) {
    return ListTile(
      leading: icon != null
          ? Icon(icon, color: leadingColor ?? Colors.grey[700])
          : null,
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
