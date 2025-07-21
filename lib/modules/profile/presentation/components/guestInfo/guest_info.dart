import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/widgets/button/custom_button.dart';
import 'package:ecommerce/core/widgets/gap/gapHeight/gap_height.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:ecommerce/modules/authentication/presentation/screens/login/login.dart';
import 'package:flutter/material.dart';

class GuestInfo extends StatelessWidget {
  const GuestInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: 'You are currently using the app as a guest',txtSize: 17,fontWeight: FontWeight.w700,),
        AppConstants.gap10,
        CustomText(text: 'Please log in to complete your purchase',txtSize: 15,),
        GapHeight(gap: 0.2),
        CustomButton(onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false,),text: 'Login',color: ColorResources.primary,circular: 10,)
      ],
    );
  }
}
