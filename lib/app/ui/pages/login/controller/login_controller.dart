

import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:proyecto_final_tm/app/domain/repositories/authentication_repository.dart';

import '../../../../domain/responses/sign_in_response.dart';

class LoginController extends SimpleNotifier {
  String _email = '', _password = '';
  final _authenticationRepository = Get.find<AuthenticationRepository>();
  final GlobalKey<FormState> formKey = GlobalKey();
  
  void onEmailChanged(String text){
    _email = text;
  }
 
  void onPasswordChanged(String text){
    _password = text;
  }

  Future<SignInResponse> submit(){
    return _authenticationRepository.signInWithEmailAndPassword(
      _email,
      _password);
  }

}