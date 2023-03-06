import 'package:flutter/material.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';
import 'package:we_care/components/smallbuttons.dart';
import 'package:we_care/components/patient.dart';
import 'package:we_care/screens/onePatient.dart';
class AddRecord extends StatelessWidget {
  AddRecord({super.key});

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
                    hintText: 'Date',
                     
                    obscureText: false),
                const SizedBox(height: 8.0),
                
                MyTextField(
                    controller: patientController,
                    hintText: 'Data type',
                   
                    obscureText: false),
                const SizedBox(height: 8.0),
                 MyTextField(
                    controller: patientController,
                    hintText: 'Value',
                   
                    obscureText: false),
                const SizedBox(height: 8.0),
               
               
                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/records');
                  },
                  buttonTitle: "Add New Record",
                  bckgColor: Colors.white,
                  buttonFontColor: Colors.black,
                ),
                const SizedBox(height: 8.0),
                 MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/records');
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
