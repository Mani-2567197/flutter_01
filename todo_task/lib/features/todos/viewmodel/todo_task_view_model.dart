import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:todo_task/features/todos/model/tod_task_model.dart';
import 'package:todo_task/features/todos/model/todo_task_create_ressponse_model.dart';
import 'package:todo_task/features/todos/model/todo_task_model_data.dart';
import 'package:todo_task/utils/server_constants.dart';


class TodoTaskViewModel extends ChangeNotifier {
  List<String> priorityList = ["High", "Medium", "Low"];
  String selectedPriority = "High";
    List<Todos> todosList = [];

  void selectPriority(String value) {
    selectedPriority = value;
    notifyListeners();
  }
  Future<TodoTaskResponse> createTaks(TodoTaskModel model) async {
    final url = ServerConstants.baseUrl + ServerConstants.createTask;
    final dioObject = Dio();
    final payload = model.toJson();

    try {
      final response = await dioObject.post(url, data: payload);
      if (response.statusCode == 200) {
        final responseData = TodoTaskResponse.fromJson(response.data);
        return responseData;
      } else {
        return TodoTaskResponse(error: true, message: "Something went wrong");
      }
    } catch (e) {
    } finally {}
    return TodoTaskResponse(error: true, message: "Something went wrong");
  }

  getAllTasks() async {
    final url = ServerConstants.baseUrl + ServerConstants.getAllTasks;
    final dioObject = Dio();
    try {
      final response =  await dioObject.get(url);
      if(response.statusCode == 200){
        TodoTaskModelData taskModelData = TodoTaskModelData.fromJson(response.data);
        todosList = taskModelData.todos ?? [];
      }
      
    } catch (e) {
      
    }finally{
          notifyListeners();
    }
    

  }

   deleteTheTask(Todos model) async{
  
    final url = ServerConstants.baseUrl + ServerConstants.deleteTask + "${model.sId}";
    final dioObject = Dio();
    try {
      final response = await dioObject.delete(url);
      if (response.statusCode == 200) {
        getAllTasks();
      }

    } catch (e) {
      
    }
    notifyListeners();
  }

  updateTheTask(TodoTaskViewModel model) {
    notifyListeners();
  }

 
}
