import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/utils/constants/app_constants.dart';
import 'package:ecommerce/core/widgets/toast/toast.dart';
import 'package:ecommerce/data/localStorage/cache_helper.dart';
import 'package:ecommerce/modules/home/data/repositories/home/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../data/models/home/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  HomeRepository homeRepository = HomeRepository();

  var searchController = TextEditingController();

  List<String> productPrices = [
    'Highest Price',
    'Lowest Price'
  ];

  /// SET FAVOURITE PRODUCTS
  List<int> favouriteProducts = [];
  setFavouriteProduct({productId}){
    if(favouriteProducts.contains(productId)){
      favouriteProducts.remove(productId);
    }else{
      favouriteProducts.add(productId);
    }
    CacheHelper.saveData(key: AppConstants.favProducts,value: favouriteProducts);
    emit(SetFavouriteProducts());
  }

  /// FAV PRODUCT
  Products getProductInfo({productId}) => productsModel!.products!.where((element) => element.id==productId).toList()[0];

  /// PRODUCT QUANTITY
  Map<int, int> productQuantities = {};
  // INCREASE QUANTITY
  increaseQuantity(int productId) {
    productQuantities.update(productId, (value) => value + 1, ifAbsent: () => 2);
    emit(ChangeQuantityState());
  }
  // DECREASE QUANTITY
  decreaseQuantity(int productId) {
    if (productQuantities[productId] != null && productQuantities[productId]! > 1) {
      productQuantities[productId] = productQuantities[productId]! - 1;
      emit(ChangeQuantityState());
    }
  }
  // GET QUANTITY
  int getQuantity(int productId) {
    return productQuantities[productId] ?? 1;
  }

  /// GET ALL CATEGORIES
  List<String?>? categories(){
    return productsModel?.products?.map((p) => p.category).where((c) => c != null).toSet().toList();
  }

  /// FILTER PRODUCTS
  String selectedCategory = 'All';
  String displaySelectedCategory = 'All';
  String selectedPrice = 'none';
  setCategory({category,price}){
    if(category != null){
      selectedCategory = category;
    }
    if(price != null){
      selectedPrice = price;
    }
    emit(CategorySelected());
  }

  filterProducts(){
    var filtered = productsModel?.products;
    if (selectedCategory != 'All') {
      displaySelectedCategory=selectedCategory;
      filtered = filtered?.where((element) => element.category == selectedCategory).toList();
    }
    if (selectedPrice == 'Lowest Price') {
      filtered?.sort((a, b) => a.price!.compareTo(b.price!));
    } else if (selectedPrice == 'Highest Price') {
      filtered?.sort((a, b) => b.price!.compareTo(a.price!));
    }
    products = filtered;
    emit(CategorySelected());
  }

  /// IS CATEGORY SELECTED
  bool isCategorySelected(String category){
    return selectedCategory == category;
  }

  /// IS PRICE SELECTED
  bool isPriceSelected(String price){
    return selectedPrice == price;
  }

  /// RESET PRICE
  resetPrice(){
    selectedCategory = 'All';
    selectedPrice = 'none';
    emit(ResetPrice());
  }

  /// CART PRODUCTS ID
  List<int> cartProductsId=[];
  setCartProductsId({productId}){
    if(cartProductsId.contains(productId)){
      cartProductsId.remove(productId);
      toast(msg: 'Product removed from cart',isError: true);
    }else{
      cartProductsId.add(productId);
      toast(msg: 'Product added to cart',isSuccess: true);
    }
    emit(SetCartProductsId());
  }

  List<Products> cartProducts(){
    return productsModel?.products?.where((element) => cartProductsId.contains(element.id)).toList()??[];
  }

  /// SET TOTAL PRICE
  String setTotalPrice(){
    double result = productsModel?.products?.where((element) => cartProductsId.contains(element.id)).map((e){
      int quantity = productQuantities[e.id]??1;
      return e.price*quantity;
    }).reduce((value, element) => value! + element!)??0.0;
    return result.toStringAsFixed(2);
  }

  ///----------------------------------------------APIs--------------------------------------------
  /// GET PRODUCTS
  ProductsModel? productsModel;
  List<Products>? products;
  getProducts() async {
    try{
      emit(GetProductsLoading());
      productsModel = await homeRepository.fetchProducts();
      products = productsModel?.products;
      emit(GetProductsSuccess());
    }catch(e){
      emit(GetProductsFailed());
    }
  }
}