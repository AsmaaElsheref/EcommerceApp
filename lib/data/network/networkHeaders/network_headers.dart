import '../../localStorage/cache_helper.dart';

Map<String, String> networkHeaders() {
  return {
    'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
    'Accept': '*/*',
    'Content-Type': 'application/json',
  };
}