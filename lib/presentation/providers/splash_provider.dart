// import 'package:flutter/material.dart';
//
// class SplashProvider extends ChangeNotifier {
//
//   void navigateAfterSplash(BuildContext context, String routeName) {
//     Future.delayed(const Duration(seconds: 4), () {
//       Navigator.pushReplacementNamed(context, routeName);
//     });
//   }
// }


import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool _isNavigated = false; // to prevent double navigation

  Future<void> navigateAfterSplash(BuildContext context, String routeName) async {
    await Future.delayed(const Duration(seconds: 4));
    if (context.mounted && !_isNavigated) {
      _isNavigated = true;
      Navigator.pushReplacementNamed(context, routeName);
    }
  }
}
