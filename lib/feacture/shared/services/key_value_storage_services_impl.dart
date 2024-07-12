import 'package:handiman_v0/feacture/shared/services/key_value_storage_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageImpl extends KeyValueStrorageService{


  @override
  Future<T?> getValue<T>(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();    
    switch(T){
      case const (int):
      return prefs.getInt(key) as T?;
      case const (String):
      return prefs.getString(key) as T?;
      default:
      throw UnimplementedError('Get not Implemented for type ${T.runtimeType}');
    }

  }

  @override
  Future<bool> removeKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);

  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch(T){
      case const (int):
      prefs.setInt(key, value as int);
      break;
      case const (String):
      prefs.setString(key, value as String);
      break;
      default:
      throw UnimplementedError('Set not Implemented for type ${T.runtimeType}');
    }
  }

}