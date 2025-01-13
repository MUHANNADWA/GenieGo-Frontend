import 'package:geniego/features/authentication/models/user_model.dart';
import 'package:geniego/utils/http/http_client.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  static login(data) async => await AppHttpHelper.post('login', data);

  static signup(data) async => await AppHttpHelper.post('register', data);

  static logout() async => await AppHttpHelper.post('logout', {});

  static updateUser(data) async => await AppHttpHelper.put('user', data);

  static updateUserImage(image) async =>
      await AppHttpHelper.postMultipart('user/upload-icon', {}, image);

  static deleteUserById(data) async => await AppHttpHelper.delete('user');

  static User get currentUser => User.fromJson(GetStorage().read('user'));

  static bool get authenticated => GetStorage().read('token') != null;

  static String get token => 'Bearer ${GetStorage().read('token')}';
}
