import 'package:flutter/material.dart';
import 'package:we_care/api/services/patient_service.dart';
import 'package:we_care/components/smallbuttons.dart';
import 'package:we_care/components/value_label.dart';
import 'package:we_care/main.dart';

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
                LabelValue(label: "Age", value: patientData.age),
                const SizedBox(height: 8.0),
                LabelValue(label: "Status", value: patientData.status),
                const SizedBox(height: 8.0),
                LabelValue(
                    label: "Current Address", value: patientData.address),
                const SizedBox(height: 8.0),
                LabelValue(label: "Allergies", value: patientData.allergies),
                const SizedBox(height: 8.0),
                LabelValue(
                    label: "Emergency Contact Name",
                    value: patientData.emergencyContactName),
                const SizedBox(height: 8.0),
                LabelValue(
                    label: "Emergency Contact Number",
                    value: patientData.emergencyContactNumber),
                const SizedBox(height: 16.0),
                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit_patient',
                        arguments: patientData);
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
                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/records',
                        arguments: patientData);
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
