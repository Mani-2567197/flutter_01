class TodoTaskModel {
  String? title;
  String? description;
  String? dueDate;
  String? priority;
  CreatedBy? createdBy;

  TodoTaskModel({this.title, this.description, this.dueDate, this.priority, this.createdBy});
  TodoTaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    dueDate = json['dueDate'];
    priority = json['priority'];
    createdBy = json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['dueDate'] = dueDate;
    data['priority'] = priority;
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    return data;
  }

}
class CreatedBy {
  String? createdByEmail;
  String? createdByName;
  CreatedBy({this.createdByEmail, this.createdByName});
  CreatedBy.fromJson(Map<String, dynamic> json) {
    createdByEmail = json['email'];
    createdByName = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = createdByEmail;
    data['name'] = createdByName;
    return data;
  }
}
