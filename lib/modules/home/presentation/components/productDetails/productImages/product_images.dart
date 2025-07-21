import 'package:ecommerce/core/widgets/gap/height/height.dart';
import 'package:ecommerce/modules/home/presentation/cubits/productDetails/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../../core/utils/constants/app_constants.dart';
import '../../../cubits/home/home/home_cubit.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height(context, 0.2),
          child: PageView.builder(
            controller: ProductDetailsCubit.get(context).pageController,
            itemBuilder: (context, index) => Image.network(HomeCubit.get(context).getProductInfo(productId: ProductDetailsCubit.get(context).currentProductId).images![index]),
            itemCount: HomeCubit.get(context).getProductInfo(productId: ProductDetailsCubit.get(context).currentProductId).images!.length,
            onPageChanged: (value) => ProductDetailsCubit.get(context).setProductImageIndex(value),
          ),
        ),
        AppConstants.gap20,
        SmoothPageIndicator(
          controller: ProductDetailsCubit.get(context).pageController,
          count: HomeCubit.get(context).getProductInfo(productId: ProductDetailsCubit.get(context).currentProductId).images!.length,
          effect: WormEffect(
            activeDotColor: ColorResources.primary,
            dotColor: ColorResources.grey2,
            dotHeight: 8,
            dotWidth: 8,
          )
        )
      ],
    );
  }
}