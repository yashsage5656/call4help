import 'package:flutter/material.dart';

class WalkthroughProvider extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void nextPage(PageController controller, int totalPages) {
    if (_currentPage < totalPages - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onGetStartedTap(BuildContext context) {
    Navigator.pushNamed(context, '/complete_profile');
  }

  void onSkipTap(BuildContext context) {
    Navigator.pushNamed(context, '/complete_profile');
  }
}
