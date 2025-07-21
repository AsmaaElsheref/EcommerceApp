import 'package:ecommerce/core/utils/color_resource/color_resource.dart';
import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/home/presentation/cubits/home/home/home_cubit.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ColorResources.lightGrey2
          ),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => cubit.decreaseQuantity(productId),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(Icons.remove, size: 20,),
                ),
              ),
              CustomText(text: cubit.getQuantity(productId).toString(), txtSize: 17,),
              GestureDetector(
                onTap: () => cubit.increaseQuantity(productId),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Icon(Icons.add, size: 18,),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
