import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/widgets/button/custom_button.dart';
import '../../../../../core/widgets/gap/gapHeight/gap_height.dart';
import '../../../../../core/widgets/gap/height/height.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../../../../home/presentation/screens/mainScreen/main_screen.dart';
import '../../components/loginAsGuest/login_as_guest.dart';
import '../../components/signup/signupEmail/signup_email.dart';
import '../../components/signup/signupPassword/signup_password.dart';
import '../../cubits/signup/signup_cubit.dart';
import '../login/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    SignupCubit.get(context).resetData();
    super.initState();
  }

  void navigateToMainScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  }

  void goToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
       if(state is SignupSuccess){
         navigateToMainScreen(context);
       }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height(context, 0.86),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginAsGuest(),
                            const GapHeight(gap: 0.08),
                            const CustomText(text: 'Create New Account',fontWeight: FontWeight.w700,txtSize: 20,),
                            AppConstants.gap5,
                            CustomText(text: 'Let’s get started ',color: ColorResources.black,),
                            SignupEmail(),
                            SignupPassword(),
                            const GapHeight(gap: 0.1),
                            CustomButton(
                              onTap: (){
                                if(formKey.currentState!.validate()&&SignupCubit.get(context).isValidation==true) {
                                  SignupCubit.get(context).signup();
                                }
                              },
                              text: 'Create an account',color: ColorResources.primary,colorBorder: ColorResources.white.withValues(alpha: 0.25),circular: 15,isLoading: state is SignupLoading,),
                            const GapHeight(gap: 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: 'Already have an account?',color: ColorResources.black,),
                                AppConstants.gapW5,
                                GestureDetector(
                                  onTap: () => goToLogin(context),
                                  child: CustomText(text: 'Sign in',color: ColorResources.blue,fontWeight: FontWeight.w500,)),
                              ],
                            ),
                            AppConstants.gap20
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}