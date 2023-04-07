import 'package:flutter/material.dart';

class DeviceModel {
  final String deviceName;
  final IconData icon;
  late bool isConnected;

  DeviceModel(this.deviceName, this.icon, this.isConnected);
}

List<DeviceModel> sensors = [
  DeviceModel('smart Light', Icons.light, false),
  DeviceModel('smart Detector', Icons.wifi, false),
  DeviceModel('smart Light', Icons.light, false),
  DeviceModel('smart Detector', Icons.wifi, false),
  DeviceModel('smart Detector', Icons.wifi, false),
  DeviceModel('smart Light', Icons.light, false),
  DeviceModel('smart Detector', Icons.wifi, false),
  DeviceModel('smart Detector', Icons.wifi_tethering, false),
];
List<DeviceModel> lights = [
  DeviceModel('smart Detector', Icons.wifi_tethering, false),
  DeviceModel('smart Detector', Icons.wifi, false),
  DeviceModel('smart Detector', Icons.wifi_tethering, false),
  DeviceModel('smart Detector', Icons.wifi, false),
  DeviceModel('smart Light', Icons.light, false),
  DeviceModel('smart Detector', Icons.wifi, false),
  DeviceModel('smart Light', Icons.light, false),
  DeviceModel('smart Detector', Icons.wifi_tethering, false),
];
List<DeviceModel> assistant = [
  DeviceModel('smart Light', Icons.light, false),
];
