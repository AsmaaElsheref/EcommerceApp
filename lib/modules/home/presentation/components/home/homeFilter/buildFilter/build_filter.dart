import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/widgets/button/custom_button.dart';
import 'package:ecommerce/core/widgets/gap/width/width.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:ecommerce/modules/home/presentation/components/home/homeFilter/showFilter/show_filter.dart';
import 'package:ecommerce/modules/home/presentation/cubits/home/home/home_cubit.dart';
import 'package:flutter/material.dart';

class BuildFilter extends StatelessWidget {
  const BuildFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: cubit.displaySelectedCategory,fontWeight: FontWeight.w700,),
            CustomText(text: '${cubit.products!.length} Results',txtSize: 13,color: ColorResources.grey5,),
          ],
        ),
        CustomButton(onTap: () => showModalBottomSheet(context: context, builder: (context) => ShowFilter(),),height: 35,width: width(context, 0.3),text: 'Filter',widget2: Icon(Icons.filter_list_outlined),colorTxt: ColorResources.black,colorBorder: ColorResources.primary.withValues(alpha: 0.3),)
      ],
    );
  }
}
