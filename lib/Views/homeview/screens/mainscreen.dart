import 'package:era/Views/onbording/onbordingScreen.dart';
import 'package:era/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../controller/sharedPreference.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<bool> status = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Home !',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
                ),
                Text(
                  userName!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    await removeDate();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnBordingScreen()));
                  },
                  icon: const Icon(
                    CupertinoIcons.person,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                      ),
                      Positioned(
                        bottom: 15,
                        right: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 7 / 6,
                  width: double.infinity,
                  //     color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                const CircleAvatar(
                                  radius: 100,
                                  backgroundColor: Colors.white,
                                ),
                                CircleAvatar(
                                  radius: 95,
                                  backgroundColor: pColor,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        const TextSpan(
                                          text: '20°',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'era',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 32),
                                        ),
                                        TextSpan(
                                          text: ' C',
                                          style: TextStyle(
                                              color: Colors
                                                  .deepPurpleAccent.shade200,
                                              fontFamily: 'era',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 32),
                                        ),
                                      ])),
                                      TextButton.icon(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons.location_solid,
                                            color: Colors
                                                .deepPurpleAccent.shade200,
                                            size: 18,
                                          ),
                                          label: const Text(
                                            'Menzel Ennour',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'era',
                                                fontWeight: FontWeight.w100,
                                                fontSize: 12),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Quick Access',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'era',
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                      )),
                    ],
                  ),
                ),
                GridView.builder(
                  itemCount: 10,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      // height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      //  width: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            CupertinoIcons.lightbulb,
                            color: Colors.black,
                            size: 28,
                          ),
                          const Text(
                            'smart light',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          FlutterSwitch(
                            width: 50.0,
                            height: 24.0,
                            toggleSize: 20.0,
                            value: status[index],
                            borderRadius: 30.0,
                            padding: 2.0,
                            activeColor: Colors.black,
                            // valueFontSize: 50.0,
                            // showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                status[index] = val;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 3,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
