import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/modules/cart/presentation/components/cartProducts/cartContainer/cart_container.dart';
import 'package:ecommerce/modules/home/presentation/cubits/home/home/home_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../home/presentation/screens/productDetails/product_details.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final products = HomeCubit.get(context).cartProducts();
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => RepaintBoundary(
          child: CartContainer(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(productId: products[index].id!,),)),
            productImg: products[index].images![0],
            productName: products[index].title!,
            productDescription: products[index].description??'',
            productPrice: '\$${products[index].price}',
            productRate: products[index].rating!.toString(),
            productId: products[index].id!,
          ),
        ),
        separatorBuilder: (context, index) => AppConstants.gap20,
        padding: const EdgeInsets.only(bottom: 20,top: 15),
        itemCount: products.length,
      ),
    );
  }
}
