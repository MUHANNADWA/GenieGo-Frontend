import 'package:geniego/features/authentication/models/user_model.dart';
import 'package:geniego/utils/http/http_client.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  static login(data) => AppHttpHelper.post('login', data);

  static signup(data) => AppHttpHelper.post('register', data);

  static logout() => AppHttpHelper.post('logout', {});

  static updateUserById(data) => AppHttpHelper.put('user', data);

  static deleteUserById(data) => AppHttpHelper.delete('user');

  static User get currentUser => User.fromJson(GetStorage().read('user'));

  static bool get authenticated => GetStorage().read('token') != null;

  static String get token => 'Bearer ${GetStorage().read('token')}';
}
