import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:proyecto_final_tm/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:proyecto_final_tm/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:proyecto_final_tm/app/domain/repositories/authentication_repository.dart';
import 'package:proyecto_final_tm/app/domain/repositories/sign_up_repository.dart';


void injectDependencies(){

  Get.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(FirebaseAuth.instance),
  
  );

  Get.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(FirebaseAuth.instance),
  
  );
}