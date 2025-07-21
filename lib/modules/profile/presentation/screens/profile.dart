import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/widgets/gap/gapHeight/gap_height.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:ecommerce/core/widgets/textField/custom_text_field.dart';
import 'package:ecommerce/data/localStorage/cache_helper.dart';
import 'package:ecommerce/modules/profile/presentation/components/userInfo/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/guestInfo/guest_info.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Profile',txtSize: 20,fontWeight: FontWeight.w600,),
            GapHeight(gap: 0.1),
            CacheHelper.getData(key: AppConstants.token)==null?
            GuestInfo():
            UserEmail()
          ],
        ),
      ),
    );
  }
}
