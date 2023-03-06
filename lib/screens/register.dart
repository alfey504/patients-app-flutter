import 'package:flutter/material.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var username = "";
  var password = "";

  final newUsernameController = TextEditingController();

  final emailController = TextEditingController();

  final newPasswordController = TextEditingController();

  void registerUser() {}

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
                        password = newText;
                      });
                    },
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(height: 16.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        username = newText;
                      });
                    },
                    controller: newPasswordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(height: 16.0),
                const SizedBox(height: 25.0),
                MyButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  buttonTitle: "Create User",
                  bckgColor: Colors.black,
                  buttonFontColor: Colors.white,
                ),
                const SizedBox(height: 15.0),
                MyButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
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
