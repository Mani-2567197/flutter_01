import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/features/todos/model/todo_task_model_data.dart';
import 'package:todo_task/features/todos/viewmodel/todo_task_view_model.dart';


class TodoTaskListView extends StatefulWidget {
  const TodoTaskListView({ Key? key }) : super(key: key);

  @override
  _TodoTaskListViewState createState() => _TodoTaskListViewState();
}

class _TodoTaskListViewState extends State<TodoTaskListView> {
  @override
  Widget build(BuildContext context) {
        final viewModel = Provider.of<TodoTaskViewModel>(context);

    return Scaffold( 
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(title: Text("Tasks List"),),
    body: Container(child: ListView.builder(itemBuilder: (context, index) {
      final todoData = viewModel.todosList[index];
      return Card(
        elevation: 5,
        color: Colors.white,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text(todoData.title ?? "",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              subtitle: Text(todoData.description ?? ""),
              trailing: designThePriority( todoData.priority ?? ""),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                children: [
                  TextButton(onPressed: (){}, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Edit"),
                  )),
                  GestureDetector(
                    onTap: () {
                      confirmDeleteTaskAlert(todoData);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Delete",style: TextStyle(color: Colors.white),),
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      );
      
    },
    itemCount: viewModel.todosList.length,
    ),
    )
    );
  }

  @override
  void initState() {
    getAllTasks();
    super.initState();
  }

  void getAllTasks() async {
    final viewModel = Provider.of<TodoTaskViewModel>(context, listen: false);
    await viewModel.getAllTasks();
  }

   Widget designThePriority(String priority) {
    TextStyle textStyle = TextStyle(color: Colors.white);
    if(priority == "High"){
      return Chip(
        label: Text(priority,style: textStyle,),
        backgroundColor: Colors.red,
      );
    }else if(priority == "Medium"){
     return Chip(
        label: Text(priority,style: textStyle,),
        backgroundColor: Colors.orange,
      );
    }else{
     return Chip(
        label: Text(priority,style: textStyle,),
        backgroundColor: Colors.yellow,
      );
    }
}

 void confirmDeleteTaskAlert(Todos task) {
  showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(task.title ?? ""),
        content: Text("Are you sure you want to delete this task?"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),
          TextButton(onPressed: (){
            deleteTask(task);
            Navigator.pop(context);
          }, child: Text("Delete"))
        ],
      );
    });

 }

 void deleteTask(Todos task) async {
  final viewModel = Provider.of<TodoTaskViewModel>(context, listen: false);
  await viewModel.deleteTheTask(task);
 }
}
