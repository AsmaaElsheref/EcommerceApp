import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/widgets/button/custom_button.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:ecommerce/modules/home/presentation/cubits/home/home/home_cubit.dart';
import 'package:flutter/material.dart';

class PaymentAction extends StatelessWidget {
  const PaymentAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: 'Total',fontWeight: FontWeight.w700,),
            CustomText(text: '${HomeCubit.get(context).setTotalPrice()} \$',fontWeight: FontWeight.w700,),
          ],
        ),
        AppConstants.gap20,
        CustomButton(text: 'Confirm & Pay',color: ColorResources.primary,circular: 10,)
      ],
    );
  }
}
