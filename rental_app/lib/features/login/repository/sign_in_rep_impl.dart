import 'package:rental_app/features/login/repository/sign_in_repository.dart';
import 'package:rental_app/services/api_services.dart';
import 'package:rental_app/utils/server_constants.dart';

class SignInRepImpl extends SignInRepository {
  final ApiServices _apiServices = ApiServices();
  @override
  Future<dynamic> signin(dynamic payload) {
    return _apiServices.postCall(ServerConstants.signin, payload);
  }
}
