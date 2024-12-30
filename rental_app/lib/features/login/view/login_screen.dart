import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/routes/routes_constanta.dart';
import 'package:rental_app/widgets/input_text_field_widget.dart';
import 'package:rental_app/widgets/button_widget.dart';
import 'package:rental_app/widgets/logo_widget.dart';
import 'package:rental_app/widgets/title_sub_title_widget.dart';
import 'package:rental_app/widgets/text_button_widget.dart';
import 'package:rental_app/services/navigation_services.dart';
import 'package:rental_app/features/login/model/sign_in_request_model.dart';
import 'package:rental_app/features/login/view_model/sign_in_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            const LogoWidget(
              height: 250,
            ),
            const TitleSubTitleWidget(
                title: "Welcome Back",
                subHeading: "Log in to your account using email "),
            const SizedBox(
              height: 20,
            ),
            InputTextFieldWidget(
              hintText: "Email",
              textEditingController: _emailTextController,
              prefixIcon: const Icon(Icons.email),
            ),
            const SizedBox(
              height: 20,
            ),
            InputTextFieldWidget(
              hintText: "Password",
              textEditingController: _passwordTextController,
              obscureText: true,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: const Icon(Icons.visibility_off),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButtonWidget(
                    buttonTitle: "Forgot Password?", onPressed: () {}),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonWidget(
                  buttonTitle: "Login",
                  onPressed: () {
                    signInAction();
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButtonWidget(
                    buttonTitle: "Sign Up",
                    onPressed: () {
                      NavigationServices()
                          .navigateTo(RoutesConstants.signUpScreen);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  void signInAction() async {
    SignInRequestModel requestModel = SignInRequestModel(
        email: _emailTextController.text,
        password: _passwordTextController.text);
    final signInvm = Provider.of<SignInViewModel>(context, listen: false);
    final response = await signInvm.signInTheUser(requestModel);
    if (response.error == false) {
      SnackBar(
          content: Text('Login Successfull !'), backgroundColor: Colors.green);
    } else {
      SnackBar(
          content: Text('Invalid Login Credentials !'),
          backgroundColor: Colors.red);
    }
  }
}
