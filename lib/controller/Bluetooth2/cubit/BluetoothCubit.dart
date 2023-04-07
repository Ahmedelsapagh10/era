import 'package:era/controller/Bluetooth2/state/BluetoothState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothCubit extends Cubit<BluetoothStates> {
  BluetoothCubit() : super(InitState());

  FlutterBluePlus flutterBluePlus = FlutterBluePlus.instance;

  ////method for scanning about devices
  Future scanDevices(BuildContext context) async {
    if (await flutterBluePlus.isOn) {
      emit(LoadingState());
      await flutterBluePlus.startScan(
        scanMode: const ScanMode(0),
        allowDuplicates: true,
        timeout: const Duration(seconds: 5),
      );
      flutterBluePlus.stopScan();
      emit(SucessState());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('turn on Bluetooth to scan'),
      ));
      emit(SucessState());
    }
  }

  Stream<List<ScanResult>> get scanResults => flutterBluePlus.scanResults;

  BluetoothDevice? connectedDevice;
  IconData blueIcon = Icons.bluetooth_connected;

  Future<void> connectMethod({required BluetoothDevice device}) async {
    try {
      emit(LoadingConnectedState());
      flutterBluePlus.stopScan();
      await device.connect();
      connectedDevice = device;
      print("connected");
      blueIcon = Icons.bluetooth_disabled;
      emit(SuccessConnectedState());
      /*
       // Discover the services offered by the device
  List<BluetoothService> services = await device.discoverServices();
  for (BluetoothService service in services) {
    print('Service found: ${service.uuid}'); */
    } catch (e) {
      print('Error connecting to device: $e');
      emit(ErrorConnectedState());
    }
    //
  }

  Future<void> disconnectFromDevice({required BluetoothDevice device}) async {
    try {
      emit(DisConnectedState());
      await device.disconnect();
      connectedDevice = null;
      print("disconnected");
      blueIcon = Icons.bluetooth_connected;
      emit(SucessDisConnectedState());
    } catch (e) {
      print('Error disconnecting from device: $e');
      emit(ErrorDisConnectedState());
    }
  }
}
