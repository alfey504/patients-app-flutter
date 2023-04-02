import 'package:flutter/material.dart';
import 'package:we_care/api/services/patient_service.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';
import 'package:we_care/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final patientController = TextEditingController();

  String patientName = "";

  void findPatientByName() {
    if (patientName.isEmpty) {
      showAlertDialog(context, "Missing Field", "Please enter a patient name");
      return;
    }

    final patientService = PatientService();
    final response = patientService.findPatientByName(patientName);

    response.then((value) {
      if (value.isEmpty) {
        showAlertDialog(context, "No Such Patient",
            "Could not find a patient with the given name");
      } else {
        Navigator.pushNamed(context, '/onepatient', arguments: value[0]);
      }
    }).catchError((error) {
      showAlertDialog(context, "Failed", "Failed to find the user");
    });
  }

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
                    onChange: (value) {
                      setState(() {
                        patientName = value;
                      });
                    },
                    controller: patientController,
                    hintText: 'Patients name',
                    obscureText: false),
                const SizedBox(height: 16.0),
                MyButton(
                    onTap: () {
                      findPatientByName();
                    },
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
