class SignInModel {
   String email;
   String password;
  SignInModel({required this.email, required this.password});
  Map<String,dynamic> toJson(){
     return{
        "password": password,
        "email": email,
      };
  }
}

class SignInOutputModel {
   String? message;
   bool? status;

  SignInOutputModel({this.message, this.status});
   

}
