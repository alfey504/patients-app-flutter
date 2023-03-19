import 'package:flutter/material.dart';
import 'package:we_care/api/services/user_service.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';
import 'package:we_care/main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var username = "";
  var password = "";
  var email = "";

  final newUsernameController = TextEditingController();

  final emailController = TextEditingController();

  final newPasswordController = TextEditingController();

  void routeToNextScreen() {
    Navigator.pushNamed(context, '/');
  }

  void registerUser() {
    final userService = ApiService();
    final response = userService.registerUser(username, email, password);

    response.then((value) {
      print(
          "${value.username}, ${value.email}, ${value.password}, ${value.id}");
      routeToNextScreen();
    }).catchError((error) {
      showAlertDialog(context, "Issue", error.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                const Icon(
                  Icons.supervised_user_circle_outlined,
                  size: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  'Complete the required fields to create a user',
                  style: TextStyle(
                    color: Colors.teal[900],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        username = newText;
                      });
                    },
                    controller: newUsernameController,
                    hintText: 'Username',
                    obscureText: false),
                const SizedBox(height: 16.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        email = newText;
                      });
                    },
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(height: 16.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        password = newText;
                      });
                    },
                    controller: newPasswordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(height: 16.0),
                const SizedBox(height: 25.0),
                MyButton(
                  onTap: () {
                    registerUser();
                  },
                  buttonTitle: "Create User",
                  bckgColor: Colors.black,
                  buttonFontColor: Colors.white,
                ),
                const SizedBox(height: 15.0),
                MyButton(
                  onTap: () {
                    print("before register: $username, $password, $email");
                    registerUser();
                  },
                  buttonTitle: "Sign In Instead",
                  bckgColor: Colors.white,
                  buttonFontColor: Colors.black,
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
