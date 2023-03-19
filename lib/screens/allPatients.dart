import 'package:flutter/material.dart';
import 'package:we_care/api/models/add_patient_response.dart';
import 'package:we_care/api/services/patient_service.dart';

import 'package:we_care/components/my_button.dart';
import 'package:we_care/components/patient.dart';
import 'package:we_care/components/patient_list.dart';

class AllPatients extends StatefulWidget {
  AllPatients({super.key});

  @override
  State<AllPatients> createState() => _AllPatientsState();
}

class _AllPatientsState extends State<AllPatients> {
  final _firstController = ScrollController();
  late Future<List<PatientDataModel>> futurePatientList;

  void goToViewPatientScreen() {}

  @override
  void initState() {
    super.initState();
    final patientService = PatientService();
    futurePatientList = patientService.getAllPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 35.0),
        child: Column(
          children: <Widget>[
            MyButton(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                buttonTitle: "Go Home",
                bckgColor: Colors.black,
                buttonFontColor: Colors.white),
            const SizedBox(height: 24.0),
            FutureBuilder(
                future: futurePatientList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PatientList(
                        onTap: (patient) {
                          Navigator.pushNamed(context, '/onepatient',
                              arguments: patient);
                        },
                        patientList: snapshot.data!,
                        bckgColor: Colors.black,
                        buttonFontColor: Colors.white);
                  } else if (snapshot.hasError) {
                    return Patient(
                        onTap: () {},
                        patientName: "Unable to fetch data",
                        patientId: "1",
                        bckgColor: Colors.black,
                        buttonFontColor: Colors.white);
                  }
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
