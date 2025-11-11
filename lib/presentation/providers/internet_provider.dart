// ignore_for_file: avoid_print

import 'package:call4help/utils/connectivity_service.dart';
import 'package:call4help/presentation/widgets/no_internet_dialog.dart';
import 'package:flutter/material.dart';

class InternetProvider extends ChangeNotifier {
  final InternetService _internetService = InternetService();
  bool _isConnected = true;
  bool get isConnected => _isConnected;

  InternetProvider(BuildContext context) {
    print('🌐 InternetProvider initialized');
    _internetService.listenConnection((status) {
      _isConnected = status;
      print('Internet status changed: $_isConnected');

      if (!_isConnected) {
        _showNoInternetDialog(context);
      } else {
        _closeNoInternetDialog(context);
      }
      notifyListeners();
    });
  }

  void _showNoInternetDialog(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const NoInternetDialog(),
    );
  }

  void _closeNoInternetDialog(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  void disposeService() {
    _internetService.dispose();
  }
}
