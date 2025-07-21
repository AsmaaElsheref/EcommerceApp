import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/widgets/button/custom_button.dart';
import 'package:ecommerce/core/widgets/gap/width/width.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:ecommerce/data/localStorage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../home/presentation/cubits/home/home/home_cubit.dart';
import '../components/cartProducts/buildCartProducts/cart_products.dart';
import '../components/guestWarning/guest_warning.dart';
import 'checkout/checkout.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Cart',txtSize: 20,fontWeight: FontWeight.w600,),
                  CartProducts(),
                  AppConstants.gap10,
                  if(cubit.cartProducts().isNotEmpty)
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Total Price',txtSize: 16,),
                          CustomText(text: '${cubit.setTotalPrice()}\$',fontWeight: FontWeight.w700,txtSize: 15,),
                        ],
                      ),
                      Spacer(),
                      CustomButton(
                        onTap: (){
                          if(CacheHelper.getData(key: AppConstants.token)==null){
                            guestWarning(context);
                          }else{
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout(),));
                          }
                        },
                        width: width(context, 0.3),height: 40,text: 'Checkout',color: ColorResources.primary,circular: 10,)
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}