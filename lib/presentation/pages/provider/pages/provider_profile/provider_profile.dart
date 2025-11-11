import 'package:call4help/presentation/pages/provider/providers/vendor_proflie_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderProfile extends StatelessWidget {
  const ProviderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VendorProfileProvider(),
      child: Consumer<VendorProfileProvider>(
        builder: (context, provider, _) {
          final isAvailable = provider.isAvailable;

          final recentEarnings = provider.recentEarnings
              .map((item) => _CardData(
            leadingIcon: item["icon"],
            title: item["title"] ?? '',
            subtitle: item["subTitle"] ?? '',
            trailingIcon: item["trailingIcon"],
          ))
              .toList();

          final settingsItems = [
            _SettingItem(
              title: "Push Notifications",
              subtitle: "Get notified about new requests",
              trailing: Switch(
                value: isAvailable,
                activeColor: const Color(0xFF243b50),
                onChanged: (val) => provider.toggleAvailability(),
              ),
            ),
            _SettingItem(
              title: "Language",
              subtitle: "English",
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {},
            ),

            _SettingItem(
              title: "Become a user",
              subtitle: "switch to become a user",
              trailing: const Icon(Icons.person),
              onTap: () => provider.onBecomeUserTap(context),
            ),
          ];

          return Scaffold(
            appBar: const PrimaryAppBar(title: "Profile"),
            body: Container(
              width: double.infinity,
              decoration: AppDecoration.gradientBackground,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProfileCard(isAvailable: isAvailable, provider: provider),
                    const SizedBox(height: 16),
                    ...recentEarnings.map((data) => _IconListCard(data: data)),
                    const SizedBox(height: 16),
                    _SettingsSection(items: settingsItems),
                    const SizedBox(height: 20),
                    const ListTile(title: Text("Terms & Conditions")),
                    const ListTile(title: Text("Help & Support")),
                    const SizedBox(height: 20),
                    _LogoutTile(onTap: () => provider.onLogoutTap(context)),
                    const SizedBox(height: 30),
                    const Center(child: Text("Call4Help Provider v1.0.0", style: TextStyle(fontSize: 13))),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final bool isAvailable;
  final VendorProfileProvider provider;

  const _ProfileCard({required this.isAvailable, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12, offset: Offset(0, 3))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: Colors.purpleAccent,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Yash", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 2),
                    Text("S/w Engineer", style: TextStyle(color: Colors.grey)),
                    Text("Mechanic •", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text("Edit", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Currently Available", style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("Toggle to show/hide from customers", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                Switch(
                  value: isAvailable,
                  activeColor: const Color(0xFF243b50),
                  onChanged: (val) => provider.toggleAvailability(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardData {
  final IconData leadingIcon;
  final String title, subtitle;
  final IconData trailingIcon;

  _CardData({required this.leadingIcon, required this.title, required this.subtitle, required this.trailingIcon});
}

class _IconListCard extends StatelessWidget {
  final _CardData data;
  const _IconListCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(data.leadingIcon, color: const Color(0xFF243b50)),
        ),
        title: Text(data.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(data.subtitle),
        trailing: Icon(data.trailingIcon, color: const Color(0xFF243b50)),
      ),
    );
  }
}

class _SettingItem {
  final String title, subtitle;
  final Widget trailing;
  final VoidCallback? onTap;

  _SettingItem({required this.title, required this.subtitle, required this.trailing, this.onTap});
}

class _SettingsSection extends StatelessWidget {
  final List<_SettingItem> items;
  const _SettingsSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: const [
        BoxShadow(blurRadius: 6, color: Colors.black12, offset: Offset(0, 3))
      ]),
      child: Column(
        children: [
          const ListTile(title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          ...items.map((item) => Column(
            children: [
              ListTile(
                title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(item.subtitle),
                trailing: item.trailing,
                onTap: item.onTap,
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class _LogoutTile extends StatelessWidget {
  final VoidCallback onTap;
  const _LogoutTile({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: const [
        BoxShadow(blurRadius: 6, color: Colors.black12, offset: Offset(0, 3))
      ]),
      child: ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: const Text("Logout", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
        onTap: onTap,
      ),
    );
  }
}
