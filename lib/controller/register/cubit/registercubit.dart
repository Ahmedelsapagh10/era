import 'package:era/Provider/register/registerrepository.dart';
import 'package:era/controller/login/cubit/logincubit.dart';
import 'package:era/controller/login/state/loginstate.dart';
import 'package:era/controller/register/state/registerstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Provider/login/loginrepository.dart';
import '../../../Views/homeview/screens/HomeScreen.dart';
import '../../../Views/loginview/loginscreen.dart';
import '../../sharedPreference.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepositoy) : super(InitRegisterState());
  final RegisterRepositoy registerRepositoy;

  TextEditingController usernameregistercontroller = TextEditingController();
  TextEditingController passwordregistercontroller = TextEditingController();
  TextEditingController firstnameregistercontroller = TextEditingController();
  TextEditingController emailregistercontroller = TextEditingController();
  TextEditingController lastnameregistercontroller = TextEditingController();
  TextEditingController phoneregistercontroller = TextEditingController();

  String token = '';
  String registerMethod(BuildContext context) {
    emit(LoadingRegisterState());
    registerRepositoy
        .registerMethod(
            userName: usernameregistercontroller.text,
            email: emailregistercontroller.text,
            firtname: firstnameregistercontroller.text,
            lastname: lastnameregistercontroller.text,
            phone: phoneregistercontroller.text,
            password: passwordregistercontroller.text)
        .then((value) {
      token = value;
      print(token);
      // userName = usernameregistercontroller.text;
      // setuserName();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('login again')));
      emit(SuccessRegisterState());
      BlocProvider.of<LoginCubit>(context).usernamelogincontroller.text =
          usernameregistercontroller.text;
      BlocProvider.of<LoginCubit>(context).passwordlogincontroller.text =
          passwordregistercontroller.text;
    });

    return token;
  }

  ///
}
