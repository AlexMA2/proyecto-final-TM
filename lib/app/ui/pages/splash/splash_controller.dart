


import 'package:flutter_meedu/meedu.dart';
import 'package:proyecto_final_tm/app/domain/repositories/authentication_repository.dart';
import 'package:proyecto_final_tm/app/ui/routes/routes.dart';

class SplashController extends SimpleNotifier {

  final _authRepository = Get.find<AuthenticationRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController(){ 
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    _routeName = user !=null ? Routes.HOME : Routes.LOGIN;
    notify();
  }

}