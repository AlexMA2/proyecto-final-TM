import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:proyecto_final_tm/app/ui/pages/splash/splash_controller.dart';

final splashProvider = SimpleProvider(
  (_) => SplashController(),
);

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onChange: (_, controller){
        final routeName = controller.routeName;
        if(routeName != null){
          router.pushReplacementNamed(routeName);
        }
      },
      builder: (_, __){
        return const Scaffold(
          body: const Center(
            child: CircularProgressIndicator()
          ),
        );
      }
    );
  }
}