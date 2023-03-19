import 'package:flutter/material.dart';

import 'package:we_care/components/smallbuttons.dart';
import 'package:we_care/components/patient.dart';

class AllRecords extends StatelessWidget {
  AllRecords({super.key});
  final _firstController = ScrollController();

  void findPatient() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Row(
              children: [
                MySmallButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/onepatient');
                    },
                    buttonTitle: "Home",
                    bckgColor: Colors.black,
                    buttonFontColor: Colors.white),
                MySmallButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/add_record');
                    },
                    buttonTitle: "Add",
                    bckgColor: const Color.fromARGB(255, 108, 171, 123),
                    buttonFontColor: const Color.fromARGB(255, 255, 255, 255)),
                MySmallButton(
                    onTap: () {
                      // Navigator.pushNamed(context, '/home');
                    },
                    buttonTitle: "Delete",
                    bckgColor: const Color.fromARGB(255, 164, 56, 56),
                    buttonFontColor: const Color.fromARGB(255, 255, 255, 255)),
              ],
            ),
            const SizedBox(height: 16.0),
            Patient(
                patientId: "1",
                onTap: () {
                  Navigator.pushNamed(context, '/onepatient');
                },
                patientName: "10/02/2023: Blood Pressure - 120/80",
                bckgColor: Colors.white,
                buttonFontColor: Colors.black),
            const SizedBox(height: 8.0),
            Patient(
                patientId: "2",
                onTap: findPatient,
                patientName: "10/02/2023: Blood Pressure - 120/80",
                bckgColor: Colors.white,
                buttonFontColor: Colors.black),
            const SizedBox(height: 8.0),
            Patient(
                patientId: "3",
                onTap: findPatient,
                patientName: "10/02/2023: Blood Pressure - 120/80",
                bckgColor: Colors.white,
                buttonFontColor: Colors.black),
            const SizedBox(height: 8.0),
            Patient(
                patientId: "3",
                onTap: findPatient,
                patientName: "10/02/2023: Blood Pressure - 120/80",
                bckgColor: Colors.white,
                buttonFontColor: Colors.black),
            const SizedBox(height: 8.0),
            Patient(
                patientId: "4",
                onTap: findPatient,
                patientName: "10/02/2023: Blood Pressure - 120/80",
                bckgColor: Colors.white,
                buttonFontColor: Colors.black),
            const SizedBox(height: 8.0),
            Patient(
                patientId: "4",
                onTap: findPatient,
                patientName: "10/02/2023: Blood Pressure - 120/80",
                bckgColor: Colors.white,
                buttonFontColor: Colors.black),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
