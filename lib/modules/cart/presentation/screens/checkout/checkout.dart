import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/imageResource/image_resources.dart';
import '../../../../../core/widgets/containerIcon/container_icon.dart';
import '../../../../../core/widgets/gap/gapHeight/gap_height.dart';
import '../../components/checkout/paymentAction/payment_action.dart';
import '../../components/checkout/payment_method/payment_method.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              GapHeight(gap: 0.02),
              Row(
                children: [
                  Align(alignment: Alignment.topLeft,child: ContainerIcon(onTap: () => Navigator.pop(context),icon: ImageResource.arrow,)),
                  AppConstants.gapW10,
                  CustomText(text: 'Checkout',fontWeight: FontWeight.w700,txtSize: 20,)
                ],
              ),
              AppConstants.gap10,
              PaymentMethod(),
              Spacer(),
              PaymentAction(),
              AppConstants.gap30,
            ],
          ),
        ),
      ),
    );
  }
}
