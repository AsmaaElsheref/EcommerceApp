import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({super.key, this.icon, this.padding, this.iconSize, this.onTap, this.iconData, this.iconColor, this.color});

  final String? icon;
  final double? iconSize;
  final double? padding;
  final IconData? iconData;
  final Color? iconColor;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color??ColorResources.lightGrey2,
          shape: BoxShape.circle
        ),
        child: Padding(
          padding: EdgeInsets.all(padding??17),
          child: iconData==null?SvgPicture.asset(icon!,height: iconSize,colorFilter: ColorFilter.mode(iconColor??ColorResources.grey4, BlendMode.srcIn),):Icon(iconData,color: iconColor??ColorResources.primary,size: iconSize??17,),
        ),
      ),
    );
  }
}
