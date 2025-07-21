import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/modules/home/presentation/cubits/mainScreen/main_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      child: GNav(
        haptic: true,
        tabBorderRadius: 20,
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 300),
        gap: 8,
        color: ColorResources.lightGrey,
        activeColor: ColorResources.primary,
        iconSize: 24,
        tabBackgroundColor: ColorResources.primary.withValues(alpha: 0.1),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        onTabChange: (value) => MainScreenCubit.get(context).changeScreen(value),
        tabs: [
          GButton(
            icon: LineIcons.home,
            text: 'Home',
          ),
          GButton(
            icon: LineIcons.shoppingBag,
            text: 'Cart',
          ),
          GButton(
            icon: LineIcons.user,
            text: 'Profile',
          )
        ]
      ),
    );
  }
}