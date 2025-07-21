import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../core/utils/print/custom_print.dart';
import '../../../core/widgets/toast/toast.dart';

dynamic handleDioError(DioException e) async {
  customPrint('GEt Exception --->> ${e.toString()}');
  customPrint('Code --->> ${e.response!.statusCode}');
  customPrint(e.response);
  if(await InternetConnectionChecker.instance.hasConnection==false){
    toast(msg: 'check the internet connection');
  }
  if (e.response?.statusCode == 400) {
    toast(msg: e.response!.data['errors'].toString(), isError: true);
  }else {
    toast(msg: "Something error, try again", isError: true);
  }
}