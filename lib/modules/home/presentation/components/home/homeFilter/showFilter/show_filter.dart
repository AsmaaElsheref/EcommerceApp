import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/widgets/button/custom_button.dart';
import 'package:ecommerce/core/widgets/gap/width/width.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:ecommerce/modules/home/presentation/cubits/home/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../productTypes/product_types.dart';
import '../filterPrice/filter_price.dart';

class ShowFilter extends StatelessWidget {
  const ShowFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return SizedBox(
          width: width(context, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstants.gap10,
                Center(child: SizedBox(width: width(context, 0.25),child: Divider(color: ColorResources.black,thickness: 2.5,))),
                AppConstants.gap20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: 'Filter By',fontWeight: FontWeight.w600,txtSize: 16,),
                    if(cubit.selectedCategory!='All'||cubit.selectedPrice!='none')
                    CustomButton(onTap: () => cubit.resetPrice(),height: 30,width: width(context, 0.3),text: 'Clear all',widget2: Icon(Icons.close),colorBorder: ColorResources.primary.withValues(alpha: 0.3),colorTxt: ColorResources.black,)
                  ],
                ),
                AppConstants.gap20,
                ProductTypes(),
                AppConstants.gap30,
                Divider(),
                AppConstants.gap10,
                const CustomText(text: 'Sort By',fontWeight: FontWeight.w600,txtSize: 16,),
                AppConstants.gap20,
                FilterPrice(),
                AppConstants.gap30,
                AppConstants.gap20,
                CustomButton(
                  onTap: () {
                    cubit.filterProducts();
                    Navigator.pop(context);
                  },
                  text: 'Confirm',color: ColorResources.primary,)
              ],
            ),
          ),
        );
      },
    );
  }
}
