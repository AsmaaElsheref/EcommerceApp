import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/utils/imageResource/image_resources.dart';
import 'package:ecommerce/core/widgets/gap/height/height.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Payment Method',fontWeight: FontWeight.w700,txtSize: 17,),
              AppConstants.gap10,
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 0),
                itemBuilder: (context, index) => Row(
                  children: [
                    Radio(value: true, groupValue: false, onChanged: (value){},),
                    [Image.asset(ImageResource.visa,height: height(context, 0.04)),Image.asset(ImageResource.master,height: height(context, 0.04),),Image.asset(ImageResource.bank,height: height(context, 0.04),)][index],
                    AppConstants.gapW10,
                    CustomText(text: '**** **** **** 1234',fontWeight: FontWeight.w500,txtSize: 15,)
                  ],
                ),
                separatorBuilder: (context, index) => AppConstants.gap5,
                itemCount: 3
              ),
            ],
          ),
        ),
      ),
    );
  }
}
