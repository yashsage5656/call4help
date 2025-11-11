import 'package:call4help/utils/connectivity_service.dart';
import 'package:flutter/material.dart';

class WelcomeProvider extends ChangeNotifier {
  bool _isCustomer = false;
  bool get isCustomer => _isCustomer;

  final InternetService _internetService = InternetService();

  // WelcomeProvider(BuildContext context) {
  //   print('WelcomeProvider initialized ✅');
  //   _internetService.listenConnection((status) {
  //     print('Internet status changed: $status');
  //
  //     if (!status) {
  //       print('⚠️ No internet connection detected.');
  //       _showNoInternetDialog(context);
  //     } else {
  //       print('✅ Internet connection restored.');
  //       // close dialog if open
  //       Navigator.of(context, rootNavigator: true).popUntil((route) => route.isFirst);
  //     }
  //   });
  // }

  void disposeService() {
    _internetService.dispose();
  }

  void onCustomerTap(BuildContext context) {
    Navigator.pushNamed(context, '/landing_screen');
  }

  void onProviderTap(BuildContext context) {
    Navigator.pushNamed(context, '/provider_landing_screen');
  }

  void selectProvider() {
    _isCustomer = false;
    notifyListeners();
  }

  // void _showNoInternetDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false, // prevent closing by tapping outside
  //     builder: (context) => const NoInternetDialog(),
  //   );
  // }
}
