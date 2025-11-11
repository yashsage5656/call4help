import 'package:call4help/presentation/pages/auth/landing_screen.dart';
import 'package:call4help/presentation/pages/auth/sign_up.dart';
import 'package:call4help/presentation/pages/booking_confirmed/booking_confirmation.dart';
import 'package:call4help/presentation/pages/bookings/my_bookings.dart';
import 'package:call4help/presentation/pages/bottom_nav_main.dart';
import 'package:call4help/presentation/pages/emergency_help.dart';
import 'package:call4help/presentation/pages/auth/login_with_phone.dart';
import 'package:call4help/presentation/pages/auth/otp_verification.dart';
import 'package:call4help/presentation/pages/home/home_screen.dart';
import 'package:call4help/presentation/pages/payment_method/select_payment_method.dart';
import 'package:call4help/presentation/pages/payments/payments_and_wallet.dart';
import 'package:call4help/presentation/pages/profile/complete_profile.dart';
import 'package:call4help/presentation/pages/profile/profile.dart';
import 'package:call4help/presentation/pages/provider/pages/auth/provider_landing_screen.dart';
import 'package:call4help/presentation/pages/provider/pages/auth/provider_phone_login.dart';
import 'package:call4help/presentation/pages/provider/pages/auth/provider_sign_up.dart';
import 'package:call4help/presentation/pages/provider/pages/auth/vendor_otp_verification.dart';
import 'package:call4help/presentation/pages/provider/pages/provider_bottom_nav.dart';
import 'package:call4help/presentation/pages/provider/pages/provider_dashboard/provider_dashboard.dart';
import 'package:call4help/presentation/pages/provider/pages/provider_profile/set_up_profile.dart';
import 'package:call4help/presentation/pages/select_date_and_time/select_date_and_time.dart';
import 'package:call4help/presentation/pages/service_booking/service_booking.dart';
import 'package:call4help/presentation/pages/service_details/service_details.dart';
import 'package:call4help/presentation/pages/services.dart';
import 'package:call4help/presentation/pages/splash_screen.dart';
import 'package:call4help/presentation/pages/track_booking.dart';
import 'package:call4help/presentation/pages/walkthrough.dart';
import 'package:call4help/presentation/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/welcome': (_) => const WelcomeScreen(),
  '/phone_login': (_) => const LoginWithPhone(),
  '/otp_verification': (_) => const OtpVerification(),
  '/splash_screen': (_) => const SplashScreen(),
  '/walkthrough': (_) => const WalkthroughScreen(),
  '/complete_profile': (_) => const CompleteProfile(),
  // '/dashboard': (_) => const Dashboard(),
  '/profile': (_) => const Profile(),
  '/emergency_help': (_) => const EmergencyHelp(),
  '/services': (_) => const Services(),
  '/service_details': (_) => const ServiceDetails(),
  '/my_bookings': (_) => const BookingHistoryScreen(),
  '/payments_and_wallet': (_) => const PaymentsAndWallet(),
  '/service_booking': (_) => const ServiceBooking(),
  '/select_date_and_time': (_) => const SelectDateAndTime(),
  '/select_payment_method': (_) => const SelectPaymentMethod(),
  '/booking_confirmed': (_) => const BookingConfirmationScreen(),
  '/landing_screen': (_) => const LandingScreen(),
  '/sign_up': (_) => const SignUp(),
  '/home': (_) => const HomeScreen(),
  '/main_screen': (_) => const MainScreen(),
  '/track_booking': (_) => const TrackBooking(),
  '/set_up_profile': (_) => const SetUpProfile(),
  '/provider_dashboard': (_) => const ProviderDashboard(),
  '/provider_bottom_nav': (_) => const ProviderBottomNav(),
  '/provider_landing_screen': (_) => const ProviderLandingScreen(),
  '/provider_sign_up': (_) => const ProviderSignUp(),
  '/vendor_phone_login': (_) => const ProviderPhoneLogin(),
  '/vendor_otp_verification': (_) => const VendorOtpVerification(),
};
