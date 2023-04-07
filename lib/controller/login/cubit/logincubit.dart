import 'package:era/controller/login/state/loginstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../Provider/login/loginrepository.dart';
import '../../../Views/homeview/screens/HomeScreen.dart';
import '../../sharedPreference.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepositoy) : super(InitLoginState());
  final LoginRepositoy loginRepositoy;

  TextEditingController usernamelogincontroller = TextEditingController();
  TextEditingController passwordlogincontroller = TextEditingController();
  String token = '';
  String loginMethod(BuildContext context) {
    emit(LoadingLoginState());
    loginRepositoy.LoginMethod(
            userName: usernamelogincontroller.text,
            password: passwordlogincontroller.text)
        .then((value) {
      if (value == 'user not found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('user not found')));
        emit(ErrorLoginState('user not found'));
      } else {
        token = value;
        print('token is ..... ' + token);
        Map<String, dynamic> ourTokenData = convertJwtToJson(token);
        print('ourTokenData is ..... ');
        print(ourTokenData);
        userName = ourTokenData["username"][0];
        email = ourTokenData["email"][0];
        firstname = ourTokenData["first_name"][0];
        lastname = ourTokenData["last_name"][0];

        setuserData();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Welcome Home!')));
        emit(SuccessLoginState());
        usernamelogincontroller.clear();
        passwordlogincontroller.clear();
      }
    });
    return token;
  }

  Map<String, dynamic> convertJwtToJson(String mytoken) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(mytoken);
    return decodedToken;
  }

  ///
}
