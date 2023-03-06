import 'package:flutter/material.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';
import 'package:we_care/components/smallbuttons.dart';
class AddPatient extends StatelessWidget {
  AddPatient({super.key});

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
                    hintText: 'First and Last Name',
                     
                    obscureText: false),
                const SizedBox(height: 8.0),
                
                MyTextField(
                    controller: patientController,
                    hintText: 'Birthday',
                   
                    obscureText: false),
                const SizedBox(height: 8.0),
                 MyTextField(
                    controller: patientController,
                    hintText: 'Status',
                   
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: 'Address',
                    
                    obscureText: false),
                const SizedBox(height: 8.0),
                
                 MyTextField(
                    controller: patientController,
                    hintText: 'Postal Code',
                   
                    obscureText: false),
                const SizedBox(height: 8.0),
               
                 MyTextField(
                    controller: patientController,
                    hintText: 'Allergies',
                    
                    obscureText: false),
                const SizedBox(height: 8.0),
                 MyTextField(
                    controller: patientController,
                    hintText: 'Emergency Contact Name',
                    
                    obscureText: false),
                const SizedBox(height: 8.0),
                 MyTextField(
                    controller: patientController,
                    hintText: 'Emergency Contact Number',
                    
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    controller: patientController,
                    hintText: 'Medical Conditions',
                   
                    obscureText: false),
                const SizedBox(height: 8.0),
               
                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/allpatients');
                  },
                  buttonTitle: "Add New Patient",
                  bckgColor: Colors.white,
                  buttonFontColor: Colors.black,
                ),
                const SizedBox(height: 8.0),
                 MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
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
