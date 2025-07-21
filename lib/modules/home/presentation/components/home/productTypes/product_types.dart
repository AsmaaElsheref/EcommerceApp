import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/widgets/button/custom_button.dart';
import 'package:ecommerce/core/widgets/gap/height/height.dart';
import 'package:ecommerce/core/widgets/gap/width/width.dart';
import 'package:ecommerce/modules/home/presentation/cubits/home/home/home_cubit.dart';
import 'package:flutter/material.dart';

class ProductTypes extends StatelessWidget {
  const ProductTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Wrap(
      runSpacing: 15,
      spacing: 10,
      children: List.generate(cubit.categories()!.length, (index) =>
        CustomButton(onTap: () => cubit.setCategory(category: cubit.categories()![index]!),height: 35,width: width(context, 0.27),text: cubit.categories()![index]!,colorBorder: ColorResources.grey2,color: cubit.isCategorySelected(cubit.categories()![index]!)?ColorResources.primary:null,textSize: 13,colorTxt: cubit.isCategorySelected(cubit.categories()![index]!)?ColorResources.white:ColorResources.black,),
      ),
    );
  }
}
