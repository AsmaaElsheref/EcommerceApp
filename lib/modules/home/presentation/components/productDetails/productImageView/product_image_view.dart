import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/widgets/gap/height/height.dart';
import 'package:ecommerce/core/widgets/gap/width/width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/home/home/home_cubit.dart';
import '../../../cubits/productDetails/product_details_cubit.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          height: height(context, 0.07),
          width: width(context, 1),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(HomeCubit.get(context).getProductInfo(productId: ProductDetailsCubit.get(context).currentProductId).images!.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: ProductDetailsCubit.get(context).productImgIndex==index?Border.all(color: ColorResources.primary):null,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 13),
                        child: Image.network(HomeCubit.get(context).getProductInfo(productId: ProductDetailsCubit.get(context).currentProductId).images![index],),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}