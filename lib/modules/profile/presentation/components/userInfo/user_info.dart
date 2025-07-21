import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/widgets/gap/gapHeight/gap_height.dart';
import 'package:ecommerce/data/localStorage/cache_helper.dart';
import 'package:ecommerce/modules/authentication/presentation/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../../../../../core/widgets/textField/custom_text_field.dart';

class UserEmail extends StatelessWidget {
  const UserEmail({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: 'Email',txtSize: 17,fontWeight: FontWeight.w600,),
        AppConstants.gap10,
        CustomTextField(
          hintText: user?.email,
          alignStart: true,
        ),
        GapHeight(gap: 0.2),
        TextButton(
          onPressed: (){
            CacheHelper.removeData(key: AppConstants.token);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false,);
          },
          child: Row(
            children: [
              Icon(Icons.logout,color: ColorResources.primary,),
              AppConstants.gapW5,
              CustomText(text: 'Logout',fontWeight: FontWeight.w500,)
            ],
        ))
      ],
    );
  }
}
