import 'package:call4help/presentation/pages/provider/pages/provider_dashboard/provider_dashboard.dart';
import 'package:call4help/presentation/pages/provider/pages/provider_earnings/provider_earnings.dart';
import 'package:call4help/presentation/pages/provider/pages/provider_profile/provider_profile.dart'
    show ProviderProfile;
import 'package:call4help/presentation/pages/provider/pages/provider_request/provider_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

final List<Widget> screens = [
  const ProviderDashboard(),
  const RequestScreen(),
  const ProviderEarnings(),
  const ProviderProfile(),
];

class ProviderBottomNav extends StatelessWidget {
  const ProviderBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                // right-to-left slide + fade
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(1.0, 0.0), // slide from right
                  end: Offset.zero,
                ).animate(animation);

                return SlideTransition(
                  position: offsetAnimation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: KeyedSubtree(
                // helps AnimatedSwitcher know which widget changed
                key: ValueKey<int>(provider.currentIndex),
                child: screens[provider.currentIndex],
              ),
            ),
            bottomNavigationBar: buildBottomNav(provider: provider),
          );
        },
      ),
    );
  }

  Widget buildBottomNav({required HomeProvider provider}) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Color(0xFF243b50)),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: provider.currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index != provider.currentIndex) {
            provider.setIndex(index);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Requests'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
