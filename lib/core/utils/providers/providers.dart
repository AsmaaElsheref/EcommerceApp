import 'package:ecommerce/modules/authentication/presentation/cubits/login/login_cubit.dart';
import 'package:ecommerce/modules/authentication/presentation/cubits/signup/signup_cubit.dart';
import 'package:ecommerce/modules/home/presentation/cubits/home/home/home_cubit.dart';
import 'package:ecommerce/modules/home/presentation/cubits/mainScreen/main_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/home/presentation/cubits/productDetails/product_details_cubit.dart';

providers(){
  return [
    BlocProvider(create: (context) => MainScreenCubit(),),
    BlocProvider(create: (context) => HomeCubit(),),
    BlocProvider(create: (context) => ProductDetailsCubit(),),
    BlocProvider(create: (context) => LoginCubit(),),
    BlocProvider(create: (context) => SignupCubit(),),
  ];
}