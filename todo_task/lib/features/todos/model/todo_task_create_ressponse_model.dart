class TodoTaskResponse {
  String? message;
  Todo? todo;
  bool? error;

  TodoTaskResponse({this.message, this.todo, this.error});

  TodoTaskResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    todo = json['todo'] != null ? new Todo.fromJson(json['todo']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.todo != null) {
      data['todo'] = this.todo!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Todo {
  String? title;
  String? description;
  String? dueDate;
  String? priority;
  CreatedBy? createdBy;
  String? sId;
  int? iV;

  Todo(
      {this.title,
      this.description,
      this.dueDate,
      this.priority,
      this.createdBy,
      this.sId,
      this.iV});

  Todo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    dueDate = json['dueDate'];
    priority = json['priority'];
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['dueDate'] = this.dueDate;
    data['priority'] = this.priority;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    data['_id'] = this.sId;
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
