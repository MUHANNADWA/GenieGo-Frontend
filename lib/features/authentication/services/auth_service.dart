import 'package:geniego/features/authentication/models/user_model.dart';
import 'package:geniego/utils/http/http_client.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  static login(userData) {
    return AppHttpHelper.post('login', userData);
  }

  static signup(userData) {
    return AppHttpHelper.post('register', userData);
  }

  static logout() {
    return AppHttpHelper.post('logout', {});
  }

  // TODO HERE EXAMPLE USER
  // AppHelper.exampleUser.toJson() ??

  static get currentUser => User.fromJson(GetStorage().read('user'));

  static get authenticated => GetStorage().read('token') ?? false;
}
