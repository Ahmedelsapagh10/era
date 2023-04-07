import 'package:era/Provider/register/registerwebservices.dart';

class RegisterRepositoy {
  final RegisterWebServices registerWebServices;
  RegisterRepositoy({
    required this.registerWebServices,
  });

  Future<String> registerMethod({
    required String userName,
    required String email,
    required String firtname,
    required String lastname,
    required String phone,
    required String password,
  }) async {
    final user = await registerWebServices.registerMethod(
      userName: userName,
      email: email,
      firtname: firtname,
      lastname: lastname,
      phone: phone,
      password: password,
    );
    print('register done');
    print(user);
    return user;
  }
}
