import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/imageResource/image_resources.dart';
import 'package:ecommerce/core/widgets/button/custom_button.dart';
import 'package:ecommerce/core/widgets/cartIcon/cart_icon.dart';
import 'package:ecommerce/core/widgets/gap/width/width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../../../core/utils/constants/app_constants.dart';
import '../../../../../../../core/widgets/gap/height/height.dart';
import '../../../../../../../core/widgets/productQuantity/product_quantity.dart';
import '../../../../../../../core/widgets/text/custom_text.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.productImg, required this.productName, required this.productPrice, required this.productId, required this.productDescription, required this.productRate, required this.onTap});

  final String productImg;
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productRate;
  final int productId;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.lightOrange,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstants.gap5,
            Row(
              children: [
                SvgPicture.asset(ImageResource.star),
                AppConstants.gapW5,
                CustomText(text: productRate,fontWeight: FontWeight.w600,txtSize: 12,),
                Spacer(),
                CustomText(text: productPrice,fontWeight: FontWeight.w600,),
              ],
            ),
            Center(child: CachedNetworkImage(imageUrl: productImg,height: height(context, 0.1),errorWidget: (context, error, stackTrace) => SizedBox(),placeholder: (context, url) => SizedBox(),)),
            AppConstants.gap10,
            CustomText(text: productName,txtSize: 12,maxLines: 1,fontWeight: FontWeight.w700,),
            AppConstants.gap5,
            CustomText(text: productDescription,txtSize: 12,maxLines: 1,textAlign: TextAlign.start,),
            AppConstants.gap10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartIcon(productId: productId),
                ProductQuantity(productId: productId,)
              ],
            ),
            AppConstants.gap10,
            CustomButton(onTap: onTap,height: 30,width: width(context, 0.4),text: 'Details',color: ColorResources.primary,circular: 10,),
          ],
        ),
      ),
    );
  }
}
