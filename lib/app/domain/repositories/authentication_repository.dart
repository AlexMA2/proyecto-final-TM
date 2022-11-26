

import 'package:firebase_auth/firebase_auth.dart';

import '../responses/sign_in_response.dart';

abstract class AuthenticationRepository{

  Future<User?> get user;
  Future<void> signOut();

  //Funcion para pasarle correo y contraseña
  Future<SignInResponse> signInWithEmailAndPassword(String email,String password);
}