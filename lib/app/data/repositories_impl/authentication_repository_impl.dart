

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_final_tm/app/domain/repositories/authentication_repository.dart';

import '../../domain/responses/sign_in_response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  
  final FirebaseAuth _auth;

  User? _user;

  final Completer<void> _completer = Completer();

  AuthenticationRepositoryImpl(this._auth){
    _init();
  }  
  @override
  // TODO: implement user
  Future<User?> get user async{
    await _completer.future;
    return _user;
  }


 void _init() async {
  _auth.authStateChanges().listen(
    (User? user) {

      if(!_completer.isCompleted){
        _completer.complete();
      }
      _user = user;
    },
  );
 }
 
  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
  
  @override
  Future<SignInResponse> signInWithEmailAndPassword(String email, String password) async {
    // TODO: implement signInWithEmailAndPassword
    try{
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user!;
      return SignInResponse(null, user);
    }on FirebaseAuthException catch(e){
      return SignInResponse(stringToSignUpError(e.code), null);
    }
  }
}