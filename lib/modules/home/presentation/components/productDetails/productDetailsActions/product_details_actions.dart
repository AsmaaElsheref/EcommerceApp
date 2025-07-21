import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/widgets/button/custom_button.dart';
import 'package:ecommerce/modules/home/presentation/cubits/home/home/home_cubit.dart';
import 'package:flutter/material.dart';

class ProductDetailsActions extends StatelessWidget {
  const ProductDetailsActions({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return CustomButton(onTap: () => HomeCubit.get(context).setCartProductsId(productId: productId),text: 'Add to cart',color: ColorResources.primary,textSize: 15,);
  }
}
