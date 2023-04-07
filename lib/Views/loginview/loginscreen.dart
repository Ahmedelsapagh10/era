import 'package:era/Views/loginview/TextformField.dart';
import 'package:era/Views/registerview/registerscreen.dart';
import 'package:era/controller/login/cubit/logincubit.dart';
import 'package:era/controller/login/state/loginstate.dart';
import 'package:era/controller/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../homeview/screens/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusNode = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var controller = BlocProvider.of<LoginCubit>(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 4,
                    ),
                    const Text(
                      'Login page',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'era',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 4,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.usernamelogincontroller,
                        text: 'Username',
                        message: 'Username not found'),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.passwordlogincontroller,
                        text: 'password',
                        message: 'password not found'),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.loginMethod(context);

                          ///setvalue of name

                        }
                      },
                      color: Colors.deepPurpleAccent.shade100,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'era',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forget Password!',
                        style: TextStyle(
                          fontFamily: 'era',
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'You don\'t have an account! ',
                          style: TextStyle(
                            fontFamily: 'era',
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontFamily: 'era',
                                decoration: TextDecoration.underline,
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.w300,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
