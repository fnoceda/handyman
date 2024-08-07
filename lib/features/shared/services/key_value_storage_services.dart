abstract class KeyValueStrorageService{
  //* la letra T significa que es un generico
  Future<void> setKeyValue<T>(String key, T value);
  Future<T?> getValue<T>(String key);
  Future<bool> removeKey(String key);

}