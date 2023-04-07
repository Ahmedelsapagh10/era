import 'package:era/Views/loginview/loginscreen.dart';
import 'package:era/controller/register/cubit/registercubit.dart';
import 'package:era/controller/register/state/registerstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/sharedPreference.dart';
import '../homeview/screens/HomeScreen.dart';
import '../loginview/TextformField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        var controller = BlocProvider.of<RegisterCubit>(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width / 8),
                    const Text(
                      'Register page',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'era',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 8,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.name,
                        controller: controller.usernameregistercontroller,
                        text: 'Username',
                        message: 'Username not found'),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailregistercontroller,
                        text: 'Email',
                        message: 'Email not found'),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.name,
                        controller: controller.firstnameregistercontroller,
                        text: 'Firstname',
                        message: 'Firstname not found'),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.name,
                        controller: controller.lastnameregistercontroller,
                        text: 'Lastname',
                        message: 'lastname not found'),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.phone,
                        controller: controller.phoneregistercontroller,
                        text: 'Phone number',
                        message: 'Phone number not found'),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.passwordregistercontroller,
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
                          controller.registerMethod(context);
                        }
                      },
                      color: Colors.deepPurpleAccent.shade100,
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'era',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: const Text(
                    //     'Forget Password!',
                    //     style: TextStyle(
                    //       fontFamily: 'era',
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.w300,
                    //     ),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'already have an account! ',
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
                                          const LoginScreen()));
                            },
                            child: const Text(
                              'Login',
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
