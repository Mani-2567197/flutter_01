import 'package:flutter/material.dart';
import 'package:rental_app/features/login/model/sign_in_request_model.dart';
import 'package:rental_app/features/login/model/sign_in_response_model.dart';
import 'package:rental_app/features/login/repository/sign_in_repository.dart';

class SignInViewModel extends ChangeNotifier {
  SignInRepository repository;
  SignInViewModel({required this.repository});

  Future<SignInResponseModel> signInTheUser(SignInRequestModel req) async{
    try{
        final response = await repository.signin(req);
      SignInResponseModel signinrespmodel =
          SignInResponseModel.fromJson(response.data);
      return signinrespmodel;
    }
    catch(e){
        return SignInResponseModel(error: true);
    }
    finally{

    }
  }

}
