import 'package:era/Views/homeview/screens/adddevice.dart';
import 'package:era/Views/homeview/widgets/addscreenwidget.dart';
import 'package:era/Views/homeview/widgets/managedevicewidget.dart';
import 'package:era/constants.dart';
import 'package:era/models/deviceModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => const AddDevice()));
                    //   Navigator.of(
                    //     context,
                    //     rootNavigator: true,
                    //   ).push(MaterialPageRoute(
                    //       builder: (context) => const AddDevice(),
                    //       maintainState: true));
                  },
                  icon: const Icon(
                    Icons.add_box_outlined,
                    size: 28,
                  )),
            )
          ],
          backgroundColor: pColor,
          elevation: 0,
          title: const Text(
            'Manage Devices',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          )),
      body: Container(
        child: CustomManageDeviceWidget(list: sensors),
      ),
      // body: Padding(
      //     padding: const EdgeInsets.all(12.0),
      //     child: SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           CustomCategotyWidget(list: sensors, name: 'sensors'),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           CustomCategotyWidget(list: lights, name: 'Lights'),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           CustomCategotyWidget(list: assistant, name: 'Assistant'),
      //         ],
      //       ),
      //     )),
    );
  }
}
