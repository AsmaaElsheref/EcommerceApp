import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../../core/utils/constants/app_constants.dart';
import '../../../../../../core/utils/validations/validators.dart';
import '../../../../../../core/widgets/text/custom_text.dart';
import '../../../../../../core/widgets/textField/custom_text_field.dart';
import '../../../cubits/signup/signup_cubit.dart';
import '../../errorValidation/error_validation.dart';

class SignupEmail extends StatelessWidget {
  const SignupEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SignupCubit.get(context);
    bool emailInvalid = cubit.emailValidation!=null&&cubit.emailValidation!='';
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstants.gap30,
            const CustomText(text: 'Email',fontWeight: FontWeight.w500,txtSize: 15,),
            AppConstants.gap5,
            CustomTextField(
              controller: cubit.emailController,
              backgroundColor: ColorResources.lightGrey2,
              borderColor: emailInvalid?ColorResources.red:null,
              nonBorder: emailInvalid?false:true,
              hintText: 'Write you email here',
              hintFontWeight: FontWeight.w400,
              alignStart: true,
              fontSize: 12,
              hintColor: ColorResources.black,
              validator: (value) => Validator.validateEmail(value,isSignup: true,context: context),
            ),
            if(emailInvalid)
              ErrorValidation(errorText: cubit.emailValidation!),
            AppConstants.gap20,
          ],
        );
      },
      );
  }
}