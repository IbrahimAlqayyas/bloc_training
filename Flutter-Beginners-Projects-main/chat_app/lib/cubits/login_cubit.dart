import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../helper/show_snack_bar.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  UserCredential? user;

  Future<void> loginUser(String email, String password) async {
    try {
      emit(Loading());
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      print(e);
      emit(LoginFailure(e.code));
    } catch (e) {
      print(e);
      emit(LoginFailure('there was an error'));
      print(e);
    }
  }


}
