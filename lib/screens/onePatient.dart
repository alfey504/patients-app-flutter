import 'package:flutter/material.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';
import 'package:we_care/components/smallbuttons.dart';
import 'package:we_care/components/patient.dart';
import 'package:we_care/screens/onePatient.dart';

class OnePatient extends StatelessWidget {
  OnePatient({super.key});
  final _firstController = ScrollController();
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
                const SizedBox(height: 20.0),
                const Icon(
                  Icons.supervised_user_circle_outlined,
                  size: 70,
                ),
                const SizedBox(height: 20),
                Text(
                  'John Doe',
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
                        '25 Years old',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      'Status: Critical',
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
                        'Current Address: 941 Progress Ave',
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
                        'Allergies: Penicilin',
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
                        'Emergency Contact Name: John',
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
                        'Allergies: Diabetes',
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
                    Navigator.pushNamed(context, '/allpatients');
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
