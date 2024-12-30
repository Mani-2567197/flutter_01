import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/features/todos/model/tod_task_model.dart';
import 'package:todo_task/features/todos/viewmodel/todo_task_view_model.dart';
import 'package:todo_task/widgets/input_text_field_widget.dart';

class TodoTaskView extends StatefulWidget {
  const TodoTaskView({Key? key}) : super(key: key);

  @override
  _TodoTaskViewState createState() => _TodoTaskViewState();
}

class _TodoTaskViewState extends State<TodoTaskView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dueDateController = TextEditingController();
  TextEditingController _createdByNameController = TextEditingController();
  TextEditingController _createdByEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo Task"),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputTextField(
                    hintText: "Enter Task Title", controller: _titleController),
                InputTextField(
                  hintText: "Enter Task Description",
                  controller: _descriptionController,
                ),
                InputTextField(
                  hintText: "Enter Task Due Date",
                  controller: _dueDateController,
                  isreadonly: true,
                  suffixIcon: InkWell(
                    onTap: () {
                      selectDueData();
                    },
                    child: Icon(Icons.calendar_today),
                  ),
                ),
                selectProrityDropDown(),
                InputTextField(
                  hintText: "Enter Task Created By Name",
                  controller: _createdByNameController,
                ),
                InputTextField(
                  hintText: "Enter Task Created By Email",
                  controller: _createdByEmailController,
                ),
                ElevatedButton(onPressed: () {
                  submitTaskDetails();

                }, child: Text("Create Task")),
                 Padding(
                   padding: const EdgeInsets.all(20),
                   child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/tasksListView");
                      },
                      child: Text("Display Tasks"),),
                 )
              ],
            ),
          ),
        ));
  }

  void submitTaskDetails() async{
    final todoTaskProvider = Provider.of<TodoTaskViewModel>(context, listen: false);
    TodoTaskModel model = TodoTaskModel(
      title: _titleController.text,
      description: _descriptionController.text,
      dueDate: _dueDateController.text,
      priority: todoTaskProvider.selectedPriority,
      createdBy: CreatedBy(
          createdByEmail: _createdByEmailController.text,
          createdByName: _createdByNameController.text),
    );
   final result = await todoTaskProvider.createTaks(model);
   if(result.error == true){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message ?? ""),
        backgroundColor: Colors.red,
      ));
   
   }else{
          ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result.message ?? ""),backgroundColor: Colors.green,));

    _createdByEmailController.clear();
    _createdByNameController.clear();
    _descriptionController.clear();
    _dueDateController.clear();
    _titleController.clear();
   }

  }

  Widget selectProrityDropDown() {
    final todoTaskProvider = Provider.of<TodoTaskViewModel>(context);
    return DropdownButton<String>(
      value: todoTaskProvider.selectedPriority,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        todoTaskProvider.selectPriority(newValue ?? todoTaskProvider.selectedPriority);
      },
      items: todoTaskProvider.priorityList
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  selectDueData() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)))
        .then((value) {
      _dueDateController.text = value.toString();
    });
  }
}
