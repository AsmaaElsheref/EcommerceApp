import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/data/localStorage/cache_helper.dart';
import 'package:ecommerce/modules/home/presentation/screens/mainScreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/theme/theme.dart';
import '../authentication/presentation/screens/login/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 855),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: MaterialApp(
            showSemanticsDebugger: false,
            theme: themeData,
            debugShowCheckedModeBanner: false,
            home: CacheHelper.getData(key: AppConstants.token)==null?Login():MainScreen(),
          ),
        );
      }
    );
  }
}