import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'accessToken');
  }

  static Future<void> saveUserId(int id) async {
    await _storage.write(key: 'userId', value: id.toString());
  }

  static Future<int?> getUserId() async {
    final id = await _storage.read(key: 'userId');
    return id != null ? int.tryParse(id) : null;
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }
}
