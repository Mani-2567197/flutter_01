import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:studentmanagement/widgets/inpu_textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User Name"),
                InpuTextfieldWidget(
                    hintText: "Enter the User Name",
                    controller: nameController,
                    validator: (value) {
                      if (!value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    }),
                Text("Email"),
                InpuTextfieldWidget(
                    hintText: "Enter Email ",
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
                      signupAction();
                    },
                    child: Text("Sign Up"))
              ],
            ),
          ),
        )));
  }

  void signupAction() async {
    final isvalid = formkey.currentState!.validate();
    if (isvalid) {
      final name = nameController.text;
      final email = emailController.text;
      final password = passwordController.text;
      final baseurl =
          "https://bnbevf6nveriumvumwe6jo6ism0ozogr.lambda-url.eu-north-1.on.aws/";
      final endpoint = "students/signup";
      final url = baseurl + endpoint;
      final payload = {
        "name": nameController,
        "password": passwordController,
        "email": emailController
      };
      final dio = Dio();
      try {
        final response = await dio.post(url, data: payload);
        print(response.data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final error = response.data["error"] ?? false;
          final message = response.data["message"] ?? false;
          if (error) {
            showAlertDialog(message);
          } else {
            print("Sign Up Success");
          }
          Navigator.pushNamed(context, "/signin");
        } 
      } catch (e) {
        print("error");
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
