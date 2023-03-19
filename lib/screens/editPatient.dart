import 'package:flutter/material.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/smallbuttons.dart';

class EditPatient extends StatelessWidget {
  EditPatient({super.key});

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
                const SizedBox(height: 8.0),
                const Icon(
                  Icons.supervised_user_circle_outlined,
                  size: 70,
                ),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: 'John Doe',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: '25/04/1990',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: 'Critical',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: '941 Progress Ave',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: 'M1T 2M5',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: 'No',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: 'Anna Doe',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: '647-xxx-xxxx',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: 'Diabetes',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/onepatient');
                  },
                  buttonTitle: "Save",
                  bckgColor: Colors.white,
                  buttonFontColor: Colors.black,
                ),
                const SizedBox(height: 8.0),
                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/onepatient');
                  },
                  buttonTitle: "Go Back",
                  bckgColor: Colors.white,
                  buttonFontColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
