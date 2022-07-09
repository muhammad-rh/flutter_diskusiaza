import 'dart:async';

import 'package:diskusiaza_mobile/models/api/user_model_api.dart';
import 'package:diskusiaza_mobile/models/token.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices extends ChangeNotifier {
  DataState dataState = DataState.loading;

  final UserModelApi _userModelApi = UserModelApi();

  String? token;

  void changeState(DataState state) {
    dataState = state;
    notifyListeners();
  }

  void postLogin(String email, String password, var context) async {
    changeState(DataState.loading);

    Token? getToken;

    try {
      getToken = await _userModelApi.login(
        email,
        password,
        context,
      );

      if (getToken?.token != null) {
        updateToken(getToken?.token);
      }

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  void postRegister(
    String firstName,
    String lastName,
    String email,
    String password,
    String tanggalLahir,
    String jenisKelamin,
    var context,
  ) async {
    changeState(DataState.loading);

    try {
      await _userModelApi.register(
        firstName,
        lastName,
        email,
        password,
        tanggalLahir,
        jenisKelamin,
        context,
      );

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  void getLogout(var context) async {
    changeState(DataState.loading);

    try {
      var result = await _userModelApi.logout(token!, context);

      if (result == 1) {
        updateToken('');
      }

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  Future updateToken(String? myToken) async {
    token = myToken;

    SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

    await tokenPrefs.setString('token', token!);
  }

  Future syncUserToken(var context) async {
    SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

    var result = tokenPrefs.getString('token');

    print('syncToken : $result');

    if (result != null && result != '') {
      token = result;
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed('/home'),
      );
    } else if (result == null || result == '') {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed('/login'),
      );
    }

    notifyListeners();
  }
}
