class UsersModel {
  List<SudentsList>? sudentsList;

  UsersModel({this.sudentsList});

  UsersModel.fromJson(Map<String, dynamic> json) {
    if (json['sudents_list'] != null) {
      sudentsList = <SudentsList>[];
      json['sudents_list'].forEach((v) {
        sudentsList!.add(new SudentsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sudentsList != null) {
      data['sudents_list'] = this.sudentsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SudentsList {
  String? sId;
  String? name;
  String? email;
  String? password;
  int? iV;

  SudentsList({this.sId, this.name, this.email, this.password, this.iV});

  SudentsList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['__v'] = this.iV;
    return data;
  }
}
