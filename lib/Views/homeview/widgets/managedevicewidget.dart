import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../constants.dart';
import '../../../models/deviceModel.dart';

class CustomManageDeviceWidget extends StatefulWidget {
  CustomManageDeviceWidget({required this.list, super.key});
  List<DeviceModel> list;
  @override
  State<CustomManageDeviceWidget> createState() =>
      _CustomManageDeviceWidgetState();
}

class _CustomManageDeviceWidgetState extends State<CustomManageDeviceWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getSize(context) / 8,
          ),
          Container(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: widget.list.length,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  height: getSize(context) / 2.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  width: getSize(context) / 2.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        widget.list[index].icon,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text(
                        widget.list[index].deviceName,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      FlutterSwitch(
                        width: 45.0,
                        height: 22.0,
                        toggleSize: 20.0,
                        value: widget.list[index].isConnected,
                        borderRadius: 30.0,
                        padding: 2.0,
                        activeColor: Colors.black,
                        // valueFontSize: 50.0,
                        // showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            widget.list[index].isConnected = val;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   childAspectRatio: 3 / 4,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
