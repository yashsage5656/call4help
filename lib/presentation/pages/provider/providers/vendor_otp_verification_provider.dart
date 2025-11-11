import 'package:call4help/presentation/pages/provider/pages/provider_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:page_route_animator/page_route_animator.dart';

class VendorOtpVerificationProvider extends ChangeNotifier {
  bool _isCustomer = false;

  bool get isCustomer => _isCustomer;

  void onContinueTap(BuildContext context) {
    Navigator.push(
      context,
      PageRouteAnimator(
         child: const ProviderBottomNav(),
        routeAnimation: RouteAnimation.rightToLeft,
        settings: const RouteSettings(name: '/provider_bottom_nav'),
        curve: Curves.easeOut,
      ),
    );
    // Navigator.pushNamed(context, '/provider_bottom_nav');
  }

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }
}
