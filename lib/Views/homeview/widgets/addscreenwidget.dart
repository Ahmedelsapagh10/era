import 'package:era/models/deviceModel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_switch/flutter_switch.dart';

import '../../../constants.dart';

class CustomCategotyWidget extends StatefulWidget {
  CustomCategotyWidget({required this.name, required this.list, super.key});
  List<DeviceModel> list;
  String name;

  @override
  State<CustomCategotyWidget> createState() => _CustomCategotyWidgetState();
}

class _CustomCategotyWidgetState extends State<CustomCategotyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.name,
              style: TextStyle(
                  color: Colors.deepPurpleAccent.shade200,
                  fontFamily: 'era',
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
        ),
        Container(
          height: getSize(context) / 3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
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
    );
  }
}
