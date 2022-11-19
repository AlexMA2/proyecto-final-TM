import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:proyecto_final_tm/app/ui/global_widgets/custom_input.dart';
import 'package:proyecto_final_tm/app/ui/pages/register/utils/send_register_form.dart';
import 'package:proyecto_final_tm/app/utils/email_validator.dart';
import 'package:proyecto_final_tm/app/utils/name_validator.dart';

import '../../routes/routes.dart';
import 'controller/register_controller.dart';
import 'controller/register_state.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_,controller){
        return Scaffold(
          backgroundColor: Color.fromRGBO(255, 243, 176, 1),
          appBar: AppBar(
            titleSpacing: 0,
            title: const Image(
              image: AssetImage("assets/images/pawcluesletra.png"),
              width: 120,
              height: 120,
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            
            child: GestureDetector(
              onTap: ()=> FocusScope.of(context).unfocus(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                color: Colors.transparent,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height : 150.0,
                        child: Image(
                        image: AssetImage("assets/images/pawclueslogo.png")
                        ),
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        'Registro',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomInputField(
                        label: 'Nombre',
                        onChanged: controller.onNamedChanged,
                        validator: (text){
                          return isValidName(text!) ? null : 'Nombre inválido';
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomInputField(
                        label: 'Apellido',
                        onChanged: controller.onLastNameChanged,
                        validator: (text){
                          return isValidName(text!) ? null : 'Apellido inválido';
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomInputField(
                        label: 'Correo',
                        inputType: TextInputType.emailAddress,
                        onChanged: controller.onEmailChanged,
                        validator: (text){
                          return isValidEmail(text!) ? null : 'Correo inválido';
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomInputField(
                        label: 'Contraseña',
                        isPassword: true,
                        onChanged: controller.onPasswordChanged,
                        validator: (text){
                          if (text!.trim().length >= 6){
                            return null;
                          }
                          return 'Contraseña muy corta';
                        },
                      ),
                      const SizedBox(height: 15),
                      Consumer(
                        builder: (_, ref, __){
                          ref.watch(registerProvider.select(
                              (_) => _.password
                            )
                          );
                          return CustomInputField(
                            label: 'Confirmar contraseña',
                            isPassword: true,
                            onChanged: controller.onVPasswordChanged,
                            validator: (text){
                              if(controller.state.password != text){
                                return 'Las contraseñas no coinciden';
                              }
                              if (text!.trim().length >= 6){
                                return null;
                              }
                              return 'Contraseña muy corta';
                            },
                          );
                        }
                      ),
                      const SizedBox(height: 20),
                      CupertinoButton(
                          color: const Color(0xFF09E2A2B),
                          onPressed: () => sendRegisterForm(context),
                          child: const Text('Registrarme',
                            style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      ),
                      CupertinoButton(
                        onPressed: () => router.pushNamed(
                            Routes.SPLASH
                        ),
                        child: const Text('Ya tengo cuenta',
                          style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                      )
                    ],
                  )
                ),
              ),
            )
          )
        );
      },
    );
  }
}