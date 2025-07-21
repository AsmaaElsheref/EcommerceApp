import 'package:flutter/material.dart';
import '../../../../cubits/home/home/home_cubit.dart';
import '../../../../screens/productDetails/product_details.dart';
import '../productContainer/product_container.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final products = HomeCubit.get(context).products;
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.61,mainAxisSpacing: 13,crossAxisSpacing: 13),
        itemBuilder: (context, index) => RepaintBoundary(
          child: ProductContainer(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(productId: products[index].id!,),)),
            productImg: products[index].images![0],
            productName: products[index].title!,
            productDescription: products[index].description??'',
            productPrice: '\$${products[index].price}',
            productRate: products[index].rating!.toString(),
            productId: products[index].id!,
          ),
        ),
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: products!.length,
      ),
    );
  }
}