import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetService {
  // Stream to listen for connection changes
  StreamSubscription? _subscription;

  void listenConnection(Function(bool) onStatusChange) {
    _subscription = Connectivity().onConnectivityChanged.listen((result) async {
      bool hasInternet = await InternetConnectionChecker().hasConnection;
      onStatusChange(hasInternet);
    });
  }

  void dispose() {
    _subscription?.cancel();
  }

  static Future<bool> checkConnection() async {
    bool isDeviceConnected = await InternetConnectionChecker().hasConnection;
    return isDeviceConnected;
  }
}
