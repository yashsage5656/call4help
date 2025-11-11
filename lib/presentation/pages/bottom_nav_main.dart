import 'package:call4help/presentation/pages/bookings/my_bookings.dart';
import 'package:call4help/presentation/pages/home/home_screen.dart';
import 'package:call4help/presentation/pages/payments/payments_and_wallet.dart';
import 'package:call4help/presentation/pages/profile/profile.dart';
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
  const HomeScreen(),
  const BookingHistoryScreen(),
  const PaymentsAndWallet(),
  const Profile(),
];

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(1.0, 0.0), // right → left
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
                // Ensures AnimatedSwitcher recognizes new screens
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF243b50),
      ),
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
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'My Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
