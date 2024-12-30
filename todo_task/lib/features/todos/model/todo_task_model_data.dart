class TodoTaskModelData {
  List<Todos>? todos;

  TodoTaskModelData({this.todos});

  TodoTaskModelData.fromJson(Map<String, dynamic> json) {
    if (json['todos'] != null) {
      todos = <Todos>[];
      json['todos'].forEach((v) {
        todos!.add(new Todos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.todos != null) {
      data['todos'] = this.todos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Todos {
  CreatedBy? createdBy;
  String? sId;
  String? title;
  String? description;
  String? dueDate;
  String? priority;
  int? iV;

  Todos(
      {this.createdBy,
      this.sId,
      this.title,
      this.description,
      this.dueDate,
      this.priority,
      this.iV});

  Todos.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    dueDate = json['dueDate'];
    priority = json['priority'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['dueDate'] = this.dueDate;
    data['priority'] = this.priority;
    data['__v'] = this.iV;
    return data;
  }
}

class CreatedBy {
  String? name;
  String? email;

  CreatedBy({this.name, this.email});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
