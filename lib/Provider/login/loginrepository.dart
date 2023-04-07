import 'package:era/Provider/login/loginwebServices.dart';

class LoginRepositoy {
  final LoginWebServices loginWebServices;
  LoginRepositoy({
    required this.loginWebServices,
  });

  Future<String> LoginMethod(
      {required String userName, required String password}) async {
    final token = await loginWebServices.LoginMethod(
        userName: userName, password: password);
    print('login done');
    print(token);
    return token;
  }
}
