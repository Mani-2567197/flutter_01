import 'package:app_mvvm_provider/featurs/signin/model/sign_in_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/server_constants.dart';

class SignInViewModel extends ChangeNotifier {
  Future<SignInOutputModel> signInTeheUser(SignInModel signupmodel) async {
    final dio = Dio();
    final url = ServerConstants.baseurl + ServerConstants.loginUrl;
    SignInOutputModel signin = SignInOutputModel();
    try {
      final response = await dio.post(url, data: signupmodel.toJson());
      signin.message = response.data["message"] ?? "Something went wrong";
      signin.status = response.data["satus"] ?? true;
    } catch (e) {
      signin.message = e.toString();
      signin.status = true;
    } finally {
      dio.close();
    }
    return signin;
  }
}
