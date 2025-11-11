import 'package:call4help/presentation/pages/splash_screen.dart';
import 'package:call4help/presentation/providers/welcome_provider.dart';
import 'package:call4help/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => WelcomeProvider()),
        // ChangeNotifierProvider(create: (ctx) => InternetProvider(ctx)),

      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF243b50),
            primary: const Color(0xFF243b50),
            secondary: const Color(0xFF243b50),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: appRoutes,
      ),
    );
  }
}
