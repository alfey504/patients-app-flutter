import 'package:flutter/material.dart';
import 'package:we_care/api/models/add_patient_response.dart';
import 'package:we_care/components/patient.dart';

class PatientList extends StatelessWidget {
  final List<PatientDataModel> patientList;
  final Color bckgColor;
  final Color buttonFontColor;
  final Function(PatientDataModel patient) onTap;

  const PatientList(
      {super.key,
      required this.onTap,
      required this.patientList,
      required this.bckgColor,
      required this.buttonFontColor});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: patientList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Patient(
                  onTap: () {
                    onTap(patientList[index]);
                  },
                  patientName: patientList[index].patientName,
                  patientId: patientList[index].id,
                  bckgColor: bckgColor,
                  buttonFontColor: buttonFontColor),
            );
          }),
    );
  }
}
