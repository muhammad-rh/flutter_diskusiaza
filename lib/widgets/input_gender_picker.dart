import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

enum Gender { L, W }

// ignore: must_be_immutable
class GenderPicker extends StatefulWidget {
  final double height;
  final double width;
  Gender? contoller;
  GenderPicker({
    Key? key,
    required this.height,
    required this.width,
    this.contoller,
  }) : super(key: key);

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: widget.width * 0.42,
          height: 46,
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.black38,
              width: 1,
            ),
          ),
          child: ListTile(
            dense: true,
            title: Text(
              'Man',
              style: poppinsLight(16, Colors.black),
            ),
            contentPadding: const EdgeInsets.only(
              left: 0,
              right: 0,
            ),
            trailing: Radio<Gender>(
              activeColor: infoColor,
              value: Gender.L,
              groupValue: widget.contoller,
              onChanged: (value) {
                setState(() {
                  widget.contoller = value!;
                });
              },
            ),
          ),
        ),
        Container(
          width: widget.width * 0.42,
          height: 46,
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.black38,
              width: 1,
            ),
          ),
          child: ListTile(
            dense: true,
            title: Text(
              'Woman',
              style: poppinsLight(16, Colors.black),
            ),
            contentPadding: const EdgeInsets.all(0),
            trailing: Radio<Gender>(
              activeColor: infoColor,
              value: Gender.W,
              groupValue: widget.contoller,
              onChanged: (value) {
                setState(() {
                  widget.contoller = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
