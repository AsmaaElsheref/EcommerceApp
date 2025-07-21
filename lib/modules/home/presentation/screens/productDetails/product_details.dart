import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/utils/imageResource/image_resources.dart';
import 'package:ecommerce/core/widgets/containerIcon/container_icon.dart';
import 'package:ecommerce/core/widgets/gap/gapHeight/gap_height.dart';
import 'package:ecommerce/core/widgets/gap/height/height.dart';
import 'package:ecommerce/modules/home/presentation/cubits/productDetails/product_details_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../core/widgets/gap/width/width.dart';
import '../../components/productDetails/productDetailsActions/product_details_actions.dart';
import '../../components/productDetails/productImageView/product_image_view.dart';
import '../../components/productDetails/productImages/product_images.dart';
import '../../components/productDetails/productInfo/product_info.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  void initState() {
    ProductDetailsCubit.get(context).setCurrentProductIndex(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              GapHeight(gap: 0.02),
              Align(alignment: Alignment.topLeft,child: ContainerIcon(onTap: () => Navigator.pop(context),icon: ImageResource.arrow,)),
              SizedBox(
                height: height(context, 0.84),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImages(),
                      AppConstants.gap30,
                      ProductImageView(),
                      GapHeight(gap: 0.05),
                      ProductInfo(),
                      AppConstants.gap10,
                      SizedBox(width: width(context, 0.9),child: Divider(color: ColorResources.grey2,)),
                      GapHeight(gap: 0.08),
                      ProductDetailsActions(productId: widget.productId,),
                      AppConstants.gap15,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}