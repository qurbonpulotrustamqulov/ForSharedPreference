import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<bool> store(String key, String data);
  String? read(StorageKey key);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences db;

  const LocalDataSourceImpl({required this.db});

  static Future<SharedPreferences> get init async {
    return SharedPreferences.getInstance();
  }

  @override
  String? read(StorageKey key) {
    return db.getString(key.name);
  }

  @override
  Future<bool> store(String key, String data) async {
    return db.setString(key, data);
  }
}

enum StorageKey { saved }
