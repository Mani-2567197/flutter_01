class SignUpInputModel {
  String? email;
  String? name;
  String? password;

  SignUpInputModel({this.email, this.name, this.password});

  Map<String,dynamic> toJson(){
     return{
        "name": name,
        "password": password,
        "email": email,
      };
  }
}

class SignUpOutputModel {
  String? message;
  bool? status;

  SignUpOutputModel({this.message, this.status});
}
