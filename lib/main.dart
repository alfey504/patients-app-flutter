import 'package:flutter/material.dart';
import 'package:we_care/api/services/api_service.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';
import 'package:we_care/screens/register.dart';
import 'package:we_care/screens/homeScreen.dart';
import 'package:we_care/screens/allPatients.dart';
import 'package:we_care/screens/onePatient.dart';
import 'package:we_care/screens/criticalPatients.dart';
import 'package:we_care/screens/addPatient.dart';
import 'package:we_care/screens/records.dart';
import 'package:we_care/screens/editPatient.dart';
import 'package:we_care/screens/addRecord.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => LoginPage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/register': (context) => RegisterScreen(),
      '/home': (context) => HomeScreen(),
      '/allpatients': (context) => AllPatients(),
      '/onepatient': (context) => OnePatient(),
      '/critical': (context) => CriticalPatients(),
      '/add': (context) => AddPatient(),
      '/records': (context) => AllRecords(),
      '/edit_patient': (context) => EditPatient(),
      '/add_record': (context) => AddRecord(),
    },
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = "";
  var password = "";

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool verifyInputs() {
    if (username == "") {
      showAlertDialog(context, "issues", "Please enter your username");
      return false;
    }

    if (password == "") {
      showAlertDialog(context, "issues", "Please enter your password");
      return false;
    }

    return true;
  }

  void signUserIn() {
    final apiService = ApiService();
    var data = apiService.loginUser(username, password);

    var success = false;

    data.then((value) {
      print(value[0].token);
      gotToHome();
    }).catchError((error) {
      showAlertDialog(context, "issues", error.message);
      print(error.message);
    });
  }

  void gotToHome() {
    Navigator.pushNamed(context, '/home');
  }

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
                  Icons.people,
                  size: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome back, you have been missed!',
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
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false),
                const SizedBox(height: 16.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        password = newText;
                      });
                    },
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25.0),
                MyButton(
                  onTap: () {
                    if (!verifyInputs()) {
                      return;
                    }
                    signUserIn();
                  },
                  buttonTitle: "Sign In",
                  bckgColor: Colors.black,
                  buttonFontColor: Colors.white,
                ),
                const SizedBox(height: 15.0),
                MyButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  buttonTitle: "Register",
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

showAlertDialog(BuildContext context, title, message) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
