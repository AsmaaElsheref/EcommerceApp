import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/data/localStorage/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/print/custom_print.dart';
import '../../../../../core/widgets/toast/toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  /// SET LOGIN DATA
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  /// VALIDATIONS
  String? emailValidation;
  String? passwordValidation;
  bool? isValidation;
  setValidation({String? email, String? password}) {
    if (email != null) emailValidation = email;
    if (password != null) passwordValidation = password;
    isValidation = (emailValidation?.isEmpty ?? false) && (passwordValidation?.isEmpty ?? false);
    emit(SetValidation());
  }


  /// TEXT SECURITY
  bool isSecure = true;
  changeSecure(){
    isSecure=!isSecure;
    emit(ChangeSecure());
  }

  /// RESET DATA
  resetData(){
    emailController.text = '';
    passwordController.text = '';
    emailValidation=null;
    passwordValidation=null;
    isSecure=true;
    isValidation=null;
    emit(ResetData());
  }

  ///----------------------------------------------APIs--------------------------------------------

  /// LOGIN
  Future<void> login() async {
    try {
      emit(LoginLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await FirebaseAuth.instance.currentUser!.getIdToken().then((token) {
        customPrint('Access Token: $token');
        CacheHelper.saveData(key: AppConstants.token, value: token);
      });
      customPrint("Login successful");
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      toast(msg: e.code,isError: true);
      emit(LoginFailed());
    }
  }

}
