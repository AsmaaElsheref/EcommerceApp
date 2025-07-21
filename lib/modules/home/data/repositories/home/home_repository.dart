import 'package:dio/dio.dart';
import '../../../../../core/utils/print/custom_print.dart';
import '../../../../../data/network/apiRoutes/api_routes.dart';
import '../../../../../data/network/dioHelper/dio_helper.dart';
import '../../models/home/product_model.dart';

class HomeRepository {

  ///-------------------------------------<<<---FETCH PRODUCTS--->>>-------------------------------------
  Future<ProductsModel> fetchProducts() async {
    try{
      Response? response = await DioHelper.getData(url: ApiRoutes.getProducts);
      customPrint('Fetch Products Response :: ${response!.data}');
      if(response.statusCode==200){
        return ProductsModel.fromJson(response.data);
      }else{
        throw Exception('Fetch Products Failed');
      }
    }catch(e){
      customPrint('Fetch Products Exception :: ${e.toString()}');
      throw Exception('Fetch Products Exception :: ${e.toString()}');
    }
  }
}