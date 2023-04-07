import 'package:era/Provider/register/registerrepository.dart';
import 'package:era/Provider/register/registerwebservices.dart';
import 'package:era/Views/onbording/onbordingScreen.dart';
import 'package:era/constants.dart';
import 'package:era/controller/Bluetooth2/cubit/BluetoothCubit.dart';
import 'package:era/controller/login/cubit/logincubit.dart';
import 'package:era/controller/register/cubit/registercubit.dart';
import 'package:era/controller/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Provider/login/loginrepository.dart';
import 'Provider/login/loginwebServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await getuserData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BluetoothCubit()),
          BlocProvider(
              create: (context) => LoginCubit(
                  LoginRepositoy(loginWebServices: LoginWebServices()))),
          BlocProvider(
              create: (context) => RegisterCubit(RegisterRepositoy(
                  registerWebServices: RegisterWebServices()))),
        ],
        child: MaterialApp(
          title: 'Era',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: pColor,
            appBarTheme:
                const AppBarTheme(backgroundColor: pColor, elevation: 0),
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
          ),
          home: const OnBordingScreen(),
        ));
  }
}
