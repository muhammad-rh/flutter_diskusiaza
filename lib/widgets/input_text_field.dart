import 'package:flutter/material.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';

// ignore: must_be_immutable
class InputTextField extends StatelessWidget {
  InputTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onCreate,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  String? Function(String?)? onCreate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: onCreate,
      onSaved: (value) {
        controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: poppinsLight(16, Colors.black),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black38,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black38,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: infoColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
