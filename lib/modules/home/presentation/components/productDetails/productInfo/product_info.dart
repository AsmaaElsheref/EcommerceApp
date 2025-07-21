import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/widgets/productQuantity/product_quantity.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/imageResource/image_resources.dart';
import '../../../../../../core/widgets/gap/width/width.dart';
import '../../../cubits/home/home/home_cubit.dart';
import '../../../cubits/productDetails/product_details_cubit.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final product = HomeCubit.get(context).getProductInfo(productId: ProductDetailsCubit.get(context).currentProductId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: width(context, 0.6),child: CustomText(text: product.title??'',fontWeight: FontWeight.w600,txtSize: 19,textAlign: TextAlign.start,)),
            Spacer(),
            ProductQuantity(productId: product.id!),
          ],
        ),
        AppConstants.gap10,
        CustomText(text: product.description??'',txtSize: 15,textAlign: TextAlign.start,),
        AppConstants.gap10,
        Row(
          children: [
            CustomText(text: '\$${product.price}',color: ColorResources.primary,fontWeight: FontWeight.w600,txtSize: 15,),
            Spacer(),
            SvgPicture.asset(ImageResource.star),
            AppConstants.gapW5,
            CustomText(text: '${product.rating}',fontWeight: FontWeight.w600,),
          ],
        )
      ],
    );
  }
}
