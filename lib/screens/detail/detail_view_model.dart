import 'package:diskusiaza_mobile/models/api/thread_api.dart';
import 'package:diskusiaza_mobile/models/thread.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailViewModel extends ChangeNotifier {
  DataState dataState = DataState.loading;

  final ThreadApi _threadApi = ThreadApi();
  Thread? threadDetail;

  void changeState(DataState state) {
    dataState = state;
    notifyListeners();
  }

  Future getThreadById(int getId, var context) async {
    changeState(DataState.loading);

    try {
      SharedPreferences tokenPrefs = await SharedPreferences.getInstance();

      var myToken = tokenPrefs.getString('token');

      threadDetail = await _threadApi.getThreadById(myToken!, getId, context);

      changeState(DataState.filled);
    } catch (e) {
      changeState(DataState.error);
    }
  }
}
