

import '../models/check_login.dart';

abstract class LocalRepositoryInterface {
  Future<String?> getToken();
   clearAllData();
  Future<void> saveToken(String? token);
  Future<CheckLoginData?> saveUser(CheckLoginData? checkLoginData);
  Future<CheckLoginData?> getUser();
}
