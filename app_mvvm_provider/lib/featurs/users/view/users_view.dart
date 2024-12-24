import 'package:app_mvvm_provider/featurs/users/viewmodel/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("UsersList"),
        ),
        body: Container(
            child: Consumer<UsersViewModel>(builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.sudentsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(value.sudentsList[index].name ?? ""),
                  subtitle: Text(value.sudentsList[index].email ?? ""),
                );
              });
        })));
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final usersViewModel = Provider.of<UsersViewModel>(context, listen: false);
    await usersViewModel.fetchUsers();
  }
}
