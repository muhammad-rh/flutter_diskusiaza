import 'dart:io';

import 'package:dio/dio.dart';
import 'package:diskusiaza_mobile/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserThreadApi {
  final API _api = API();

  Future postThread(
    String getToken,
    String title,
    String content,
    int category,
    File? file,
    var context,
  ) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      var formData = FormData.fromMap({
        "judul": title,
        "isi": content,
        "kategori_therad_id": category,
      });

      var response = await _api.dio.post(
        't/user/therad',
        data: formData,
      );

      if (response.statusCode == 201) {
        Fluttertoast.showToast(
          msg: "Successful Post",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }

      Navigator.pop(context);
    } on DioError catch (e) {
      String msg = e.response!.data
          .toString()
          .replaceAll('{message: ', '')
          .replaceAll('}', '');
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return null;
  }
}
