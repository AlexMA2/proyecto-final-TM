

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:proyecto_final_tm/app/domain/inputs/sign_up.dart';
import 'package:proyecto_final_tm/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:proyecto_final_tm/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:proyecto_final_tm/app/ui/pages/register/register_page.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../domain/responses/sign_up_response.dart';
import '../../../routes/routes.dart';

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;

  final isValidForm = controller.formKey.currentState!.validate();

  if(isValidForm){

    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null){
      late String content;
      switch(response.error){
        case SignUpError.emailAlreadyInUse:
          content = "El correo ya se encuentra registrado";
          break;
        case SignUpError.weakPassword:
          content = "La contraseña es muy débil";
          break;
        case SignUpError.unknown:
        default:
          content = "Ha ocurrido un error";
          break;
      }
      Dialogs.alert(
        context,
        title: "Error",
        content: content
      );

    }else{
      router.pushNamedAndRemoveUntil(Routes.HOME);
    }
  } else {
    Dialogs.alert(
      context,
      title: "Titulo",
      content: "Invalido"
    );
  }
}