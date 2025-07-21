import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/modules/home/presentation/cubits/home/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../../core/widgets/productLoading/product_loading.dart';
import '../../../components/home/homeFilter/buildFilter/build_filter.dart';
import '../../../components/home/products/buildProducts/products.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    HomeCubit.get(context).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () => HomeCubit.get(context).getProducts(),
              color: ColorResources.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    AppConstants.gap20,
                    if(HomeCubit.get(context).products!=null)
                    BuildFilter(),
                    AppConstants.gap20,
                    state is GetProductsLoading||HomeCubit.get(context).products==null?
                    ProductLoading():
                    ProductsView(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}