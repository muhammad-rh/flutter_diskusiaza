import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';

class InputDatePicker extends StatelessWidget {
  const InputDatePicker({
    Key? key,
    required this.dateController,
  }) : super(key: key);

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('yyyy-MM-dd');

    return SizedBox(
      height: 46,
      child: DateTimeField(
        controller: dateController,
        format: formatter,
        onShowPicker: (context, currValue) async {
          final date = await showDatePicker(
            context: context,
            initialDate: currValue ?? DateTime.now(),
            firstDate: DateTime(1945),
            lastDate: DateTime.now(),
          );

          if (date != null) {
            return date;
          } else {
            return currValue;
          }
        },
        style: poppinsLight(16, Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          hintText: formatter.format(DateTime.now()),
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
            size: 30,
          ),
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
      ),
    );
  }
}
