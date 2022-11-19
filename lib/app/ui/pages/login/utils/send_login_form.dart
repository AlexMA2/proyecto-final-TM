

import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/app/domain/responses/sign_in_response.dart';
import 'package:proyecto_final_tm/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:proyecto_final_tm/app/ui/pages/login/login_page.dart';

import '../../../global_widgets/dialogs/dialogs.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../routes/routes.dart';
Future<void> sendLoginForm(BuildContext context) async{
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if(isValidForm){
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if(response.error != null ){
      String errorMessage = "";

      switch(response.error){
        case SignInError.networkRequestFailed:
          errorMessage = "No cuentas con internet";
          break;
        case SignInError.userDisabled:
          errorMessage = "Usuario deshabilitado";
          break;
        case SignInError.userNotFound:
          errorMessage = "Usuario no encontrado";
          break;
        case SignInError.wrongPassword:
          errorMessage = "Contraseña incorrecta";
          break;
        case SignInError.unknown:
        default:
          errorMessage = "Ha ocurrido un error";
          break;

      }

      Dialogs.alert(
        context,
        title: "Error",
        content: errorMessage,
      );
    }else{
      router.pushNamedAndRemoveUntil(Routes.HOME);
    }
  }
  
}