import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/data/localStorage/cache_helper.dart';
import 'package:ecommerce/modules/home/presentation/screens/mainScreen/main_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/text/custom_text.dart';

class LoginAsGuest extends StatelessWidget {
  const LoginAsGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        CacheHelper.removeData(key: AppConstants.token);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(),));
      },
      child: Align(
        alignment: Alignment.topRight,
        child: const CustomText(
          text: 'Skip',
          fontWeight: FontWeight.w700,
          txtSize: 20,
          color: Colors.red,
        )
      )
    );
  }
}