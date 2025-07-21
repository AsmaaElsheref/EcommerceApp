import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/widgets/button/custom_button.dart';
import '../../../../../core/widgets/gap/gapHeight/gap_height.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../../../../home/presentation/screens/mainScreen/main_screen.dart';
import '../../components/login/loginEmail/login_email.dart';
import '../../components/login/loginPassword/login_password.dart';
import '../../components/loginAsGuest/login_as_guest.dart';
import '../../cubits/login/login_cubit.dart';
import '../signup/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    LoginCubit.get(context).resetData();
    super.initState();
  }

  void navigateToMainScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  }

  void goToSignup(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Signup()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccess){
          navigateToMainScreen(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoginAsGuest(),
                      const GapHeight(gap: 0.08),
                      const CustomText(text: 'Login to your account',fontWeight: FontWeight.w700,txtSize: 20,),
                      AppConstants.gap5,
                      CustomText(text: 'Welcome back',color: ColorResources.black,),
                      const LoginEmail(),
                      const LoginPassword(),
                      const GapHeight(gap: 0.1),
                      CustomButton(
                        onTap: (){
                          if(formKey.currentState!.validate()&&LoginCubit.get(context).isValidation==true){
                            LoginCubit.get(context).login();
                          }
                        },
                        text: 'Login',color: ColorResources.primary,colorBorder: ColorResources.white.withValues(alpha: 0.25),circular: 15,isLoading: state is LoginLoading,),
                      const GapHeight(gap: 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(text: 'Don’t have an account?',color: ColorResources.black),
                          AppConstants.gapW5,
                          GestureDetector(
                            onTap: () => goToSignup(context),
                            child: CustomText(text: 'Sign up',color: ColorResources.blue,fontWeight: FontWeight.w500,)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}