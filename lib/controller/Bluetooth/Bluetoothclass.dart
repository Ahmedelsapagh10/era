// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// class MyBluetooth extends GetxController {
//   FlutterBluePlus flutterBluePlus = FlutterBluePlus.instance;

//   ////method for scanning about devices
//   Future scanDevices(BuildContext context) async {
//     if (await flutterBluePlus.isOn) {
//       await flutterBluePlus.startScan(
//         timeout: const Duration(seconds: 5),
//       );
//       flutterBluePlus.stopScan();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('turn on Bluetooth to scan'),
//       ));
//     }
//   }

//   BluetoothDevice? connectedDevice;

//   Future<void> connectMethod({required BluetoothDevice device}) async {
//     try {
//       flutterBluePlus.stopScan();
//       await device.connect();
//       connectedDevice = device;
//       print("connected");
//       /*
//        // Discover the services offered by the device
//   List<BluetoothService> services = await device.discoverServices();

//   for (BluetoothService service in services) {
//     print('Service found: ${service.uuid}'); */
//     } catch (e) {
//       print('Error connecting to device: $e');
//     }
//     //
//   }

//   Future<void> disconnectFromDevice({required BluetoothDevice device}) async {
//     try {
//       await device.disconnect();
//       connectedDevice = null;
//       print("disconnected");
//     } catch (e) {
//       print('Error disconnecting from device: $e');
//     }
//   }

//   Stream<List<ScanResult>> get scanResults => flutterBluePlus.scanResults;
// }
