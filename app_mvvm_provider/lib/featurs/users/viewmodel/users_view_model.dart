import 'package:app_mvvm_provider/featurs/users/model/users_model.dart';
import 'package:app_mvvm_provider/utils/server_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends ChangeNotifier {
  List<SudentsList> sudentsList = [];

  Future<void> fetchUsers() async {
    final url = ServerConstants.baseurl + ServerConstants.userslist;
    final dio = Dio();
    try {
      final response = await dio.get(url);
      UsersModel usermodel = UsersModel.fromJson(response.data);
      sudentsList = usermodel.sudentsList ?? [];
      notifyListeners();
    } catch (e) {
    } finally {}
  }
}
