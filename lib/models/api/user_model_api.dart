import 'package:dio/dio.dart';
import 'package:diskusiaza_mobile/models/token.dart';
import 'package:diskusiaza_mobile/models/user_model.dart';
import 'package:diskusiaza_mobile/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModelApi {
  final API _api = API();

  Future<Token?> login(
    String email,
    String password,
    var context,
  ) async {
    try {
      var response = await _api.dio.post(
        'auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        Token token = Token.fromJson(response.data);

        Navigator.of(context).pushReplacementNamed('/home');

        Fluttertoast.showToast(
          msg: "Wellcome $email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        return token;
      }
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

  Future<UserModel?> register(
    String firstName,
    String lastName,
    String email,
    String password,
    String tanggalLahir,
    String jenisKelamin,
    var context,
  ) async {
    try {
      var response = await _api.dio.post(
        'auth/register',
        data: {
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'password': password,
          'tanggalLahir': tanggalLahir,
          'jenisKelamin': jenisKelamin,
        },
      );

      if (response.statusCode == 200) {
        // final body = response.data;

        Navigator.of(context).pushNamed('/login');

        Fluttertoast.showToast(
          msg: "Registering Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
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

  Future logout(String getToken, var context) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      var response = await _api.dio.get('t/auth/logout');

      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacementNamed('/login');

        Fluttertoast.showToast(
          msg: "Logout Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        return 1;
      }
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

  Future<UserModel> getDataProfile(String getToken, var context) async {
    try {
      _api.dio.options.headers["Authorization"] = "Bearer $getToken";

      var response = await _api.dio.get('t/user/profile');

      if (response.statusCode == 200) {
        ResponseResultUserModel responseResult =
            ResponseResultUserModel.fromJson(response.data);

        return responseResult.data;
      }
    } on DioError catch (e) {
      String msg = e.response!.data
          .toString()
          .replaceAll('{message: ', '')
          .replaceAll('}', '');

      if (e.response!.statusCode == 401) {
        SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

        await tokenPrefs.setString('token', '');

        Navigator.of(context).pushReplacementNamed('/login');
      }
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
    return UserModel();
  }
}
