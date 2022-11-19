import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:proyecto_final_tm/app/ui/global_widgets/custom_input.dart';
import 'package:proyecto_final_tm/app/ui/pages/login/controller/login_controller.dart';
import 'package:proyecto_final_tm/app/ui/pages/login/utils/send_login_form.dart';
import 'package:proyecto_final_tm/app/utils/email_validator.dart';

import '../../routes/routes.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(),
);

class LoginPage extends StatelessWidget {
  const  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ProviderListener<LoginController>(
      provider: loginProvider,
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
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height : 150.0,
                            child: Image(
                            image: AssetImage("assets/images/pawclueslogo.png")
                            ),
                          ),
                          const Text(
                            textAlign: TextAlign.center,
                            'Ingresar',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          CustomInputField(
                            label: "Correo",
                            onChanged: controller.onEmailChanged,
                            inputType: TextInputType.emailAddress,
                            validator: (text){
                              if(isValidEmail(text!)){
                                return null;
                              }
                              return "Correo inválido";
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInputField(
                            label: "Contraseña",
                            isPassword: true,
                            onChanged: controller.onPasswordChanged,
                            validator: (text){
                              if(text!.trim().length >= 6){
                                return null;
                              }
                              return "Contraseña inválida";
                            },
                          ),
                          const SizedBox(height: 15),
                          CupertinoButton(
                              color: const Color(0xFF09E2A2B),
                              onPressed: () => sendLoginForm(context),
                              child: const Text('Ingresar',
                                style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    const Text('¿No tienes cuenta?',
                      style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      )
                    ),
                    CupertinoButton(
                        onPressed: () => router.pushNamed(
                            Routes.REGISTER
                        ),
                        child: const Text('Registrarme',
                          style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    ),
                  ],
                ),
              ),
            ),
          )
        );
      },
    );

  }
}