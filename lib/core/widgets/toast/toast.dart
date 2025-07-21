import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/color_resource/color_resource.dart';

Future<bool?> toast({required String msg,bool? isError,isSuccess}){
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: isError==true?ColorResources.red:isSuccess==true?ColorResources.green:ColorResources.black,
    textColor: ColorResources.white,
    fontSize: 18.0,
  );
}