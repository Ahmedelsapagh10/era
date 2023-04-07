// import 'package:era/controller/Bluetooth/Bluetoothclass.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:get/get.dart';

// import '../../../constants.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: GetBuilder<MyBluetooth>(
//             init: MyBluetooth(),
//             builder: (controller) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     TextButton(
//                         onPressed: () {
//                           controller.scanDevices(context);
//                         },
//                         child: const Icon(Icons.search)),
//                     StreamBuilder<List<ScanResult>>(
//                         stream: controller.scanResults,
//                         builder: (context, snapshot) {
//                           if (snapshot.hasData) {
//                             return ListView.builder(
//                                 itemCount: snapshot.data!.length,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) {
//                                   final data = snapshot.data![index];
//                                   return Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Card(
//                                       elevation: 2,
//                                       child: ListTile(
//                                         title: Text(
//                                           data.device.name,
//                                           style: const TextStyle(
//                                               color: Colors.white),
//                                         ),
//                                         subtitle: Text(
//                                           data.device.id.id,
//                                           style: const TextStyle(
//                                               color: Colors.white),
//                                         ),
//                                         trailing: Text(
//                                           data.rssi.toString(),
//                                           style: const TextStyle(
//                                               color: Colors.white),
//                                         ),
//                                         leading: IconButton(
//                                             onPressed: () {
//                                               controller.connectedDevice == null
//                                                   ? controller.connectMethod(
//                                                       device: data.device)
//                                                   : controller
//                                                       .disconnectFromDevice(
//                                                           device: data.device);
//                                             },
//                                             icon: Icon(controller
//                                                         .connectedDevice ==
//                                                     null
//                                                 ? Icons.bluetooth_connected
//                                                 : Icons.bluetooth_disabled)),
//                                       ),
//                                     ),
//                                   );
//                                 });
//                           } else {
//                             return const Center(
//                               child: Text(
//                                 'No devices found',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             );
//                           }
//                         })
//                   ],
//                 ),
//               );
//             }));
//   }
// }
