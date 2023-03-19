import 'package:flutter/material.dart';
import 'package:we_care/api/services/patient_service.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';
import 'package:we_care/components/smallbuttons.dart';
import 'package:we_care/components/patient.dart';
import 'package:we_care/main.dart';
import 'package:we_care/screens/onePatient.dart';

import '../api/models/add_patient_response.dart';

class OnePatient extends StatelessWidget {
  late PatientDataModel patientData;

  OnePatient({super.key});

  final _firstController = ScrollController();
  final patientController = TextEditingController();

  void findPatient() {}
  void registerUser() {}

  @override
  Widget build(BuildContext context) {
    // getting the patient data from thr arguments
    patientData =
        ModalRoute.of(context)!.settings.arguments as PatientDataModel;

    void deletePatient() {
      final patientService = PatientService();
      print(patientData.id);
      final response = patientService.deletePatientById(patientData.id);

      response.then((value) {
        if (value) {
          Navigator.pushNamed(context, '/allpatients');
        } else {
          showAlertDialog(context, "Issue", "Failed to delete user");
        }
      }).onError((error, stackTrace) {
        showAlertDialog(context, "Issue", error.toString());
      });
    }

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
                  size: 70,
                ),
                const SizedBox(height: 20),
                Text(
                  patientData.patientName,
                  style: TextStyle(
                    color: Colors.teal[900],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        patientData.age,
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      'Status: ${patientData.status}',
                      style: TextStyle(
                        color: Colors.teal[900],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Text(
                        'Current Address: ${patientData.address}',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Text(
                        'Allergies: ${patientData.allergies}',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Text(
                        'Emergency Contact Name: ${patientData.emergencyContactName}',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Text(
                        'Emergency contact number: ${patientData.emergencyContactNumber}',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(24.0),
                //   child: Row(
                //     children: [
                //       Text(
                //             'LATEST RECORDS',
                //             style: TextStyle(
                //               color: Colors.teal[900],
                //               fontSize: 16,
                //               fontWeight: FontWeight.bold
                //             ),
                //           ),
                //             ],
                //   ),
                // ),

                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit_patient');
                  },
                  buttonTitle: "Edit",
                  bckgColor: const Color.fromARGB(255, 108, 171, 123),
                  buttonFontColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                const SizedBox(height: 8.0),
                MySmallButton(
                  onTap: () {
                    deletePatient();
                  },
                  buttonTitle: "Delete",
                  bckgColor: const Color.fromARGB(255, 164, 56, 56),
                  buttonFontColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                const SizedBox(height: 50.0),
                // ListView(
                //   children: const <Widget>[
                //     ListTile(
                //       title: Text('Map'),
                //     ),
                //     ListTile(
                //       title: Text('Album'),
                //     ),
                //     ListTile(
                //       title: Text('Phone'),
                //     ),
                //   ],
                // ),
                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/records');
                  },
                  buttonTitle: "All Records",
                  bckgColor: Colors.white,
                  buttonFontColor: Colors.black,
                ),
                const SizedBox(height: 8.0),
                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  buttonTitle: "Go Home",
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
