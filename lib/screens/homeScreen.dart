import 'package:flutter/material.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final patientController = TextEditingController();

  void findPatient() {}
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
                const SizedBox(height: 20.0),
                const Icon(
                  Icons.supervised_user_circle_outlined,
                  size: 100,
                ),
                const SizedBox(height: 20),
                Text(
                  'Find a patient',
                  style: TextStyle(
                    color: Colors.teal[900],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                MyTextField(
                    controller: patientController,
                    hintText: 'Patients name',
                  
                    obscureText: false),
                const SizedBox(height: 16.0),
                MyButton(
                    onTap: registerUser,
                    buttonTitle: "Find Patient",
                    bckgColor: Colors.black,
                    buttonFontColor: Colors.white),
                const SizedBox(height: 25.0),
                MyButton(
                  onTap: () {
                      Navigator.pushNamed(context, '/allpatients');
                    },
                  buttonTitle: "See All Patients",
                  bckgColor: Colors.black,
                  buttonFontColor: Colors.white,
                ),
                const SizedBox(height: 16.0),
                MyButton(
                 onTap: () {
                      Navigator.pushNamed(context, '/critical');
                    },
                  buttonTitle: "See All Critical Patients",
                  bckgColor: Colors.black,
                  buttonFontColor: Colors.white,
                ),
                const SizedBox(height: 16.0),
                MyButton(
                 onTap: () {
                      Navigator.pushNamed(context, '/add');
                    },
                  buttonTitle: "Add New Patient",
                  bckgColor: Colors.black,
                  buttonFontColor: Colors.white,
                ),
                const SizedBox(height: 16.0),
                MyButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  buttonTitle: "Sign Out",
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
