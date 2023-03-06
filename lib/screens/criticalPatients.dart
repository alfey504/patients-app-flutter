import 'package:flutter/material.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';
import 'package:we_care/components/patient.dart';
import 'package:we_care/screens/onePatient.dart';



class CriticalPatients extends StatelessWidget {
  CriticalPatients({super.key});
  final _firstController = ScrollController();

  void findPatient() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        
        body: ListView(
          children: <Widget>[
             MyButton( onTap: () {
                    Navigator.pushNamed(context, '/home');
                  }, buttonTitle: "Go Home", bckgColor: Colors.black, buttonFontColor: Colors.white),
              const SizedBox(height:24.0),
            Patient(
                onTap: () {
                    Navigator.pushNamed(context, '/onepatient');
                  },
                patientID: "Patient 1",
                bckgColor: Colors.white,
                buttonFontColor: Colors.black),
                const SizedBox(height:8.0),
           Patient(
                onTap: findPatient,
                patientID: "Patient 2",
                bckgColor: Colors.white,
                buttonFontColor: Colors.black),
                const SizedBox(height:8.0),
            Patient(
                onTap: findPatient,
                patientID: "Patient 3",
                bckgColor: Colors.white,
                buttonFontColor: Colors.black),
                const SizedBox(height:8.0),
            Patient(
                onTap: findPatient,
                patientID: "Patient 4",
                bckgColor: Colors.white,
                buttonFontColor: Colors.black),
                const SizedBox(height:8.0),
          ],
        ),
      ),
    );
  }
}
