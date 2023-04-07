import 'dart:async';

import 'package:era/Views/homeview/screens/homescreen.dart';
import 'package:era/controller/sharedPreference.dart';
import 'package:flutter/material.dart';

import '../loginview/loginscreen.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  @override
  void initState() {
    getuserData();
    Timer(const Duration(seconds: 1), () {
      userName != null
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              child: const Text(
                'Era',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'era',
                  fontWeight: FontWeight.w700,
                ),
              ),
            )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'POWERED BY',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.deepPurpleAccent.shade200,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Image.asset(
                    'assets/images/2.png',
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
