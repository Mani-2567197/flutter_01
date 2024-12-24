import 'package:app_mvvm_provider/featurs/signup/model/sign_up_model.dart';
import 'package:app_mvvm_provider/featurs/signup/viewmodel/sign_up_view_model.dart';
import 'package:app_mvvm_provider/widgets/input_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
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
              InpuTextfieldWidget(controller: nameController, hintText: "Name"),
              InpuTextfieldWidget(
                  controller: emailController, hintText: "Email"),
              InpuTextfieldWidget(
                  controller: passwordController, hintText: "Password"),
              ElevatedButton(
                  onPressed: () {
                    signUpAction();
                  },
                  child: Text("Sign Up"))
            ],
          ),
        ));
  }

  Future<void> signUpAction() async {
    SignUpInputModel signupinput = SignUpInputModel(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    final signupviemodel = Provider.of<SignUpViewModel>(context, listen: false);
    final result = await signupviemodel.signUpTeheUser(signupinput);

    if (result.status == false) {
      Navigator.pushNamed(context, "/signin");
    } else {
      showAlertDialog(result.message ?? "","Error");
    }
  }

  void showAlertDialog(String message,String title) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
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
