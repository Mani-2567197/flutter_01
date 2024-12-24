import 'package:app_mvvm_provider/featurs/signup/model/sign_up_model.dart';
import 'package:app_mvvm_provider/utils/server_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  Future<SignUpOutputModel> signUpTeheUser(SignUpInputModel signupmodel) async {
    final dio = Dio();
    final url = ServerConstants.baseurl + ServerConstants.signUpUrl;
    SignUpOutputModel signup = SignUpOutputModel();
    try {
      final response = await dio.post(url, data: signupmodel.toJson());
      signup.message = response.data["message"] ?? "Something went wrong";
      signup.status = response.data["satus"] ?? true;
    } catch (e) {
      signup.message = e.toString();
      signup.status = true;
    } finally {
      dio.close();
    }
    return signup;
  }
}
