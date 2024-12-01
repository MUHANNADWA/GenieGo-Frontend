import 'package:geniego/utils/http/http_client.dart';

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
}
