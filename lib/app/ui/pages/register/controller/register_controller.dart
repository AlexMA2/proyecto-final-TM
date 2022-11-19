
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:proyecto_final_tm/app/domain/inputs/sign_up.dart';
import 'package:proyecto_final_tm/app/domain/repositories/sign_up_repository.dart';
import 'package:proyecto_final_tm/app/ui/pages/register/controller/register_state.dart';

import '../../../../domain/repositories/authentication_repository.dart';
import '../../../../domain/responses/sign_up_response.dart';



class RegisterController extends StateNotifier<RegisterState>{
  RegisterController() : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey();
  final _signUpRepository = Get.find<SignUpRepository>();

  Future<SignUpResponse> submit(){
    return _signUpRepository.register(
      SignUpData(
        name: state.name, 
        lastname: state.lastname, 
        email: state.email, 
        password: state.password
      )
    );
  }

  void onNamedChanged(String text){
    state = state.copyWith(name : text);
  }

  void onLastNameChanged(String text){
    state = state.copyWith(lastname : text);
  }

  void onEmailChanged(String text){
    state = state.copyWith(email : text);
  }

  void onPasswordChanged(String text){
    state = state.copyWith(password : text);
  }
  void onVPasswordChanged(String text){
    state = state.copyWith(vPpassword : text);
  }

}