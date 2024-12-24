import 'package:app_mvvm_provider/featurs/signin/model/sign_in_model.dart';
import 'package:app_mvvm_provider/featurs/signin/viewmodel/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/input_textfield_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({ Key? key }) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InpuTextfieldWidget(
                  controller: emailController, hintText: "Email"),
              InpuTextfieldWidget(
                  controller: passwordController, hintText: "Password"),
              ElevatedButton(
                  onPressed: () {
                    signInAction();
                  },
                  child: Text("Sign Up"))
            ],
          ),
        ));
  }

  void signInAction() async {
    SignInModel signupinput = SignInModel(
      email: emailController.text,
      password: passwordController.text,
    );
    final signupviemodel = Provider.of<SignInViewModel>(context, listen: false);
    final result = await signupviemodel.signInTeheUser(signupinput);

    if (result.status == false) {
       Navigator.pushNamed(context, "/users");
    } else {
      showAlertDialog(result.message ??"");
    }
  }

  void showAlertDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(""),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }
}
