import 'package:era/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {required this.controller,
      required this.text,
      required this.message,
      required this.keyboardType,
      super.key});
  TextEditingController controller;
  String message;
  String text;
  TextInputType keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Invalid ${widget.message}..!';
          }
          return null;
        },
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          color: pColor,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
          hintText: widget.text,
          fillColor: Colors.grey.shade100,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
}
