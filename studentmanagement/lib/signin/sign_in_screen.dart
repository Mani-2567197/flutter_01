import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:studentmanagement/widgets/inpu_textfield_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Email"),
              InpuTextfieldWidget(
                  hintText: "Enter Email",
                  controller: emailController,
                  validator: (value) {
                    if (!value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  }),
              Text("Password"),
              InpuTextfieldWidget(
                  hintText: "Enter password",
                  controller: passwordController,
                  obsecuretext: true,
                  validator: (value) {
                    if (!value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  }),
              ElevatedButton(
                  onPressed: () {
                    signinAction();
                  },
                  child: Text("Login"))
            ],
          ),
        )));
  }

  void signinAction() async {
    final isvalid = formkey.currentState!.validate();
    if (isvalid) {
      final email = emailController.text;
      final password = passwordController.text;
      final payload = {"email": email, "password": password};
      final baseurl =
          "https://bnbevf6nveriumvumwe6jo6ism0ozogr.lambda-url.eu-north-1.on.aws/";
      final endpoint = "students/login";
      final url = baseurl + endpoint;
      final dio = Dio();
      try {
        final response = await dio.post(url, data: payload);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final error = response.data["error"] ?? false;
          final student = response.data["student"];
          final token = response.data["token"];
          if (error) {
            showAlertDialog(error);
          } else {
            Navigator.pushNamed(context, "/users");
          }
        }
      } catch (e) {
      } finally {
        dio.close();
      }
    }
  }

  void showAlertDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Already Exists"),
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
