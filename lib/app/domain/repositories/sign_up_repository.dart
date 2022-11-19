


import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_final_tm/app/domain/inputs/sign_up.dart';

import '../responses/sign_up_response.dart';

abstract class SignUpRepository {

  Future<SignUpResponse> register(SignUpData data);

}