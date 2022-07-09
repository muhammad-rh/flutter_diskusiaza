import 'package:diskusiaza_mobile/models/api/thread_api.dart';
import 'package:diskusiaza_mobile/models/api/user_model_api.dart';
import 'package:diskusiaza_mobile/models/thread.dart';
import 'package:diskusiaza_mobile/models/user_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends ChangeNotifier {
  DataState dataState = DataState.loading;

  final UserModelApi _userModelApi = UserModelApi();
  UserModel? dataProfile;

  void changeState(DataState state) {
    dataState = state;
    notifyListeners();
  }

  void getDataProfile(var context) async {
    changeState(DataState.loading);

    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      String? myToken = tokenPrefs.getString('token');

      dataProfile = await _userModelApi.getDataProfile(myToken!, context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  final ThreadApi _threadApi = ThreadApi();

  List<Thread> allUserThreadList = [];

  Future getThreadByUser(var context) async {
    changeState(DataState.loading);

    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      allUserThreadList = await _threadApi.getThreadByUser(myToken!, context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }

  Future postLikeThread(int getId, int getIndex, var context) async {
    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      bool result = await _threadApi.postLikeThread(
        myToken!,
        getId,
        context,
      );

      allUserThreadList[getIndex].isLike = result;

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }
}
