import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/imageResource/image_resources.dart';
import 'package:ecommerce/core/widgets/containerIcon/container_icon.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:ecommerce/modules/home/presentation/cubits/home/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../../core/utils/constants/app_constants.dart';
import '../../../../../../core/widgets/cartIcon/cart_icon.dart';
import '../../../../../../core/widgets/gap/height/height.dart';
import '../../../../../../core/widgets/productQuantity/product_quantity.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({super.key, required this.productImg, required this.productName, required this.productDescription, required this.productPrice, required this.productRate, required this.onTap, required this.productId});

  final String productImg;
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productRate;
  final int productId;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorResources.lightOrange,
          borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            CachedNetworkImage(imageUrl: productImg,height: height(context, 0.1),errorWidget: (context, error, stackTrace) => SizedBox(),placeholder: (context, url) => SizedBox(),),
            AppConstants.gapW10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImageResource.star),
                      AppConstants.gapW5,
                      CustomText(text: productRate,fontWeight: FontWeight.w600,txtSize: 12,),
                      Spacer(),
                      CustomText(text: productPrice,fontWeight: FontWeight.w600,),
                    ],
                  ),
                  AppConstants.gap5,
                  CustomText(text: productName,txtSize: 14,fontWeight: FontWeight.w700,),
                  AppConstants.gap5,
                  CustomText(text: productDescription,txtSize: 13,maxLines: 2,textAlign: TextAlign.start,),
                  AppConstants.gap10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerIcon(onTap: () => HomeCubit.get(context).setCartProductsId(productId: productId),iconData: Icons.delete,padding: 10,iconSize: 20,),
                      ProductQuantity(productId: productId,)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
