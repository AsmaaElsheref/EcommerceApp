import '../../../modules/authentication/presentation/cubits/login/login_cubit.dart';
import '../../../modules/authentication/presentation/cubits/signup/signup_cubit.dart';

class Validator{

  static String? validatePhone( value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp =RegExp(pattern);
    if (value.isEmpty) {
      return 'Enter Your Number';
    }
    else if(!regExp.hasMatch(value)){
      return 'Invalid Number';

    }
    else {
      return null;
    }
  }

  static String? validateEmail( value,{isSignup,isLogin,context}) {
    String pattern= r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      setEmailValidation(isSignup: isSignup,isLogin: isLogin,context: context,msg: 'Enter Your Email');
      return null;
    }
    else if (!regExp.hasMatch(value)) {
      setEmailValidation(isSignup: isSignup,isLogin: isLogin,context: context,msg: 'Invalid Email');
      return null;
    }
    else {
      setEmailValidation(isSignup: isSignup,isLogin: isLogin,context: context,msg: '');
      return null;
    }
  }

  static String? setEmailValidation({isSignup,isLogin,isForgetPassword,isDemo,context,msg}){
    if(isSignup==true){
      SignupCubit.get(context).setValidation(email: msg);
      return null;
    }
    if(isLogin==true){
      LoginCubit.get(context).setValidation(email: msg);
    }
    return null;
  }

  static String?  validatePassword(value, {isLogin,isSignup,context}){
    RegExp upperCase=RegExp(r'^(?=.*?[A-Z])');
    RegExp smallCase=RegExp(r'^(?=.*?[a-z])');
    RegExp number=RegExp(r'^(?=.*?[0-9])');
    RegExp symbol=RegExp(r'(?=.*?[!@#\&*~])');
    if(value!=''&&value!=null){
      if(isLogin!=true){
        if(value.length<8){
          setPasswordValidation(isSignup: isSignup,context: context,msg: 'Password should be at least 8 characters');
        }
        else if(!upperCase.hasMatch(value)){
          setPasswordValidation(isSignup: isSignup,context: context,msg: 'Password should contain at least 1 uppercase letter');
        }
        else if(!smallCase.hasMatch(value)){
          setPasswordValidation(isSignup: isSignup,context: context,msg: 'Password should contain at least 1 lowercase letter');
        }
        else if(!number.hasMatch(value)){
          setPasswordValidation(isSignup: isSignup,context: context,msg: 'Password should contain at least 1 digit');
        }
        else if(!symbol.hasMatch(value)){
          setPasswordValidation(isSignup: isSignup,context: context,msg: 'Password should contain at least 1 special character');
        }
        else if(isSignup==true){
          setPasswordValidation(isSignup: true,context: context,msg: '');
        }
        return null;
      }
    }
    else {
      setPasswordValidation(isSignup: isSignup,context: context,msg: 'Enter Your Password');
      if(isLogin==true){
        LoginCubit.get(context).setValidation(password: 'Enter Your Password');
      }
      return null;
    }
    setPasswordValidation(isSignup: isSignup,context: context,msg: '');
    if(isLogin==true){
      LoginCubit.get(context).setValidation(password: '');
    }
    return null;
  }

  static String? setPasswordValidation({isSignup,context,msg}){
    SignupCubit.get(context).setValidation(password: msg);
    return null;
  }

  static String? validateEmpty( value) {
    if(value.isEmpty) {
      return "This field is required";
    }else {
      return null;
    }
  }
}