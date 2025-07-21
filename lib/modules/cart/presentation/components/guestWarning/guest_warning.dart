import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:ecommerce/modules/authentication/presentation/screens/login/login.dart';
import 'package:flutter/material.dart';

guestWarning(context){
  return showDialog(context: context, builder: (context) => AlertDialog(
    backgroundColor: ColorResources.white,
    title: Icon(Icons.info_outline,color: ColorResources.primary,size: 30,),
    content: CustomText(text: 'Please login to continue',fontWeight: FontWeight.w700,txtSize: 17,),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: CustomText(text: 'Cancel',fontWeight: FontWeight.w500,),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false,);
        },
        child: CustomText(text: 'Login',color: ColorResources.primary,fontWeight: FontWeight.w500,),
      ),
    ],
  ),);
}