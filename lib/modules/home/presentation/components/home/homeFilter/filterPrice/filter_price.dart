import 'package:flutter/material.dart';
import '../../../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../../../core/widgets/button/custom_button.dart';
import '../../../../../../../core/widgets/gap/width/width.dart';
import '../../../../cubits/home/home/home_cubit.dart';

class FilterPrice extends StatelessWidget {
  const FilterPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Wrap(
      runSpacing: 15,
      spacing: 10,
      children: List.generate(cubit.productPrices.length, (index) =>
        CustomButton(onTap: () => cubit.setCategory(price: cubit.productPrices[index]),height: 35,width: width(context, 0.27),text: cubit.productPrices[index],colorBorder: ColorResources.grey2,color: cubit.isPriceSelected(cubit.productPrices[index])?ColorResources.primary:null,textSize: 13,colorTxt: cubit.isPriceSelected(cubit.productPrices[index])?ColorResources.white:ColorResources.black,),
      ),
    );
  }
}
