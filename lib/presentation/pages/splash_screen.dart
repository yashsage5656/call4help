// import 'package:call4help/presentation/providers/splash_provider.dart';
// import 'package:call4help/presentation/widgets/color_decoration.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SplashProvider(),
//       builder: (context, child) {
//         // Delay navigation after build
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           Provider.of<SplashProvider>(context, listen: false)
//               .navigateAfterSplash(context, '/welcome');
//         });
//
//         return Scaffold(
//           body: Container(
//             width: double.infinity,
//             decoration: AppDecoration.gradientBackground,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Image.asset(
//                     "assets/logo.png",
//                     width: 120,
//                     height: 120,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   "Call4Help",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const Text(
//                   "Your trusted service companion",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//


import 'package:call4help/presentation/providers/splash_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(),
      builder: (context, child) {
        // Trigger navigation once after first frame
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<SplashProvider>().navigateAfterSplash(context, '/welcome');
        });

        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: AppDecoration.gradientBackground,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 12),
                const Text(
                  "Call4Help",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Your trusted service companion",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
