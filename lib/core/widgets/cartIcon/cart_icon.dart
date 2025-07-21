import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import '../../../modules/home/presentation/cubits/home/home/home_cubit.dart';
import '../../utils/color_resource/color_resource.dart';
import '../../utils/imageResource/image_resources.dart';
import '../containerIcon/container_icon.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return ContainerIcon(
          onTap: () => cubit.setCartProductsId(productId: productId),
          icon: ImageResource.cart,
          color: cubit.cartProductsId.contains(productId)?ColorResources.primary:null,
          iconColor: cubit.cartProductsId.contains(productId)?ColorResources.white:null,
          iconSize: 17,
          padding: 10,
        );
      },
    );
  }
}