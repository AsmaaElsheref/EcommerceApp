import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  /// SET PRODUCT IMAGE INDEX
  var pageController = PageController();
  int productImgIndex = 0;
  setProductImageIndex(index){
    productImgIndex=index;
    emit(SetProductImageIndex());
  }

  /// SET CURRENT PRODUCT INDEX
  int? currentProductId;
  setCurrentProductIndex(productId){
    currentProductId = productId;
    productImgIndex = 0;
    emit(SetCurrentProductIndex());
  }
}
