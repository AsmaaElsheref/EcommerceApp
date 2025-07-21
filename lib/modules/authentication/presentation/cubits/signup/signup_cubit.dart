import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/print/custom_print.dart';
import '../../../../../core/widgets/toast/toast.dart';
import '../../../../../data/localStorage/cache_helper.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context)=>BlocProvider.of(context);

  /// TEXT SECURITY
  bool isSecure = true;
  changeSecure() {
    isSecure = !isSecure;
    emit(ChangeSecure());
  }

  /// SIGNUP DATA
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  /// RESET DATA
  resetData() {
    emailController.text = '';
    passwordController.text = '';
    emailValidation = null;
    passwordValidation = null;
    isValidation = null;
    emit(ResetData());
  }

  /// VALIDATIONS
  String? emailValidation;
  String? passwordValidation;
  bool? isValidation;

  setValidation({email, password}) {
    if (email != null) {
      emailValidation = email;
    }
    if (password != null) {
      passwordValidation = password;
    }
    if ((emailValidation == '') &&
        (passwordValidation == '')) {
      isValidation = true;
    } else {
      isValidation = false;
    }
    emit(SetValidation());
  }

  ///----------------------------------------------APIs--------------------------------------------

  /// SIGNUP
  Future<void> signup() async {
    try {
      emit(SignupLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await FirebaseAuth.instance.currentUser!.getIdToken().then((token) {
        customPrint('Access Token: $token');
        CacheHelper.saveData(key: AppConstants.token, value: token);
      });
      customPrint("Registered successfully");
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      toast(msg: e.code,isError: true);
      emit(SignupFailed());
    }
  }

}
