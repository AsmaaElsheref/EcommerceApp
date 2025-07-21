import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../../core/utils/constants/app_constants.dart';
import '../../../../../../core/utils/validations/validators.dart';
import '../../../../../../core/widgets/text/custom_text.dart';
import '../../../../../../core/widgets/textField/custom_text_field.dart';
import '../../../cubits/signup/signup_cubit.dart';
import '../../errorValidation/error_validation.dart';

class SignupPassword extends StatelessWidget {
  const SignupPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SignupCubit.get(context);
    final passwordInvalid = cubit.passwordValidation!=null&&cubit.passwordValidation!='';
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(text: 'Password',fontWeight: FontWeight.w500,txtSize: 15,),
            AppConstants.gap5,
            CustomTextField(
              controller: cubit.passwordController,
              backgroundColor: ColorResources.lightGrey2,
              borderColor: passwordInvalid?ColorResources.red:null,
              nonBorder: passwordInvalid?false:true,
              hintText: 'Write password here',
              hintFontWeight: FontWeight.w400,
              alignStart: true,
              fontSize: 12,
              hintColor: ColorResources.black,
              obscureText: cubit.isSecure,
              suffix: GestureDetector(
                onTap: (){
                  cubit.changeSecure();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(cubit.isSecure==true?Icons.visibility_off_rounded:Icons.visibility,size: 16,color: ColorResources.black,),
                ),
              ),
              validator: (value) => Validator.validatePassword(value,isSignup: true,context: context),
            ),
            if(passwordInvalid)
              ErrorValidation(errorText: cubit.passwordValidation!),
            AppConstants.gap10
          ],
        );
      },
    );
  }
}