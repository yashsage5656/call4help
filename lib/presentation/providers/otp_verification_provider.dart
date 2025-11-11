import 'package:call4help/presentation/pages/bottom_nav_main.dart';
import 'package:flutter/material.dart';
import 'package:page_route_animator/page_route_animator.dart';

class OtpVerificationProvider extends ChangeNotifier {
  bool _isCustomer = false;
  bool get isCustomer => _isCustomer;

  void onContinueTap(BuildContext context) {
    Navigator.push(
      context,
      PageRouteAnimator(
        child: const MainScreen(),
        routeAnimation: RouteAnimation.rightToLeft,
        settings: const RouteSettings(
          name: '/main_screen',
        ),
        curve: Curves.easeOut,
      ),
    );
  }

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }




  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }
}
