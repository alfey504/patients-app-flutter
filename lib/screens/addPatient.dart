import 'package:flutter/material.dart';
import 'package:we_care/api/services/patient_service.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/my_button.dart';
import 'package:we_care/components/smallbuttons.dart';
import 'package:we_care/main.dart';

class AddPatient extends StatefulWidget {
  AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  var patientName = "";
  var age = "";
  var dob = "";
  var status = "";
  var address = "";
  var city = "";
  var postalCode = "";
  var allergies = "";
  var emergencyContactName = "";
  var emergencyContactNumber = "";
  var medicalCondition = "";

  final patientNameController = TextEditingController();
  final ageController = TextEditingController();
  final dobController = TextEditingController();
  final statusController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();
  final allergiesController = TextEditingController();
  final emergencyContactNameController = TextEditingController();
  final emergencyContactNumberController = TextEditingController();
  final medicalConditionController = TextEditingController();

  void goToAllPatientsScreen() {
    Navigator.pushNamed(context, '/allpatients');
  }

  bool isANumber(String str) {
    try {
      int.parse(str);
      return true;
    } catch (error) {
      return false;
    }
  }

  bool verifyInputs() {
    if (patientName.isEmpty) {
      showAlertDialog(context, "Missing Fields", "Please enter your full name");
      return false;
    }
    if (age.isEmpty || !isANumber(age)) {
      showAlertDialog(context, "Missing Fields", "Invalid age");
      return false;
    }
    if (dob.isEmpty) {
      showAlertDialog(
          context, "Missing Fields", "Please enter a date of birth");
      return false;
    }
    if (status.isEmpty) {
      showAlertDialog(context, "Missing Fields", "Please enter a Status");
      return false;
    } else if (status != "Critical" && status != "Non Critical") {
      showAlertDialog(context, "Invalid Status",
          "Status can only be either Critical or Non Critical");
      return false;
    }
    if (address.isEmpty) {
      showAlertDialog(context, "Missing Fields", "Please enter a Address");
      return false;
    }
    if (postalCode.isEmpty) {
      showAlertDialog(context, "Missing Fields", "Please enter a postal code");
      return false;
    }
    if (allergies.isEmpty) {
      showAlertDialog(context, "Missing Fields", "Please enter a allergies");
      return false;
    }
    if (emergencyContactName.isEmpty) {
      showAlertDialog(
          context, "Missing Fields", "Please enter a Emergency Contact Name");
      return false;
    }
    if (emergencyContactNumber.isEmpty) {
      showAlertDialog(
          context, "Missing Fields", "Please enter a Emergency Contact Number");
      return false;
    }
    if (medicalCondition.isEmpty) {
      showAlertDialog(
          context, "Missing Fields", "Please enter a Medical Condition");
      return false;
    }

    return true;
  }

  void addPatient() {
    if (!verifyInputs()) {
      return;
    }

    final patientService = PatientService();
    final response = patientService.addPatient(
        patientName,
        age,
        dob,
        status,
        address,
        city,
        postalCode,
        allergies,
        emergencyContactName,
        emergencyContactNumber,
        medicalCondition);

    response.then((value) {
      print(
          "${value.patientName}, ${value.age}, ${value.dob}, ${value.status}, ${value.address}, ${value.city}, ${value.postalCode}");
      goToAllPatientsScreen();
    }).catchError((error) {
      showAlertDialog(context, "Issues", error.toString());
    });
  }

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
                    onChange: (String newText) {
                      setState(() {
                        patientName = newText;
                      });
                    },
                    controller: patientNameController,
                    hintText: 'First and Last Name',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        age = newText;
                      });
                    },
                    controller: ageController,
                    hintText: 'Age',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        dob = newText;
                      });
                    },
                    controller: dobController,
                    hintText: 'Birthday',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        status = newText;
                      });
                    },
                    controller: statusController,
                    hintText: 'Status',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        address = newText;
                      });
                    },
                    controller: addressController,
                    hintText: 'Address',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        postalCode = newText;
                      });
                    },
                    controller: postalCodeController,
                    hintText: 'Postal Code',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        allergies = newText;
                      });
                    },
                    controller: allergiesController,
                    hintText: 'Allergies',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        emergencyContactName = newText;
                      });
                    },
                    controller: emergencyContactNameController,
                    hintText: 'Emergency Contact Name',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        emergencyContactNumber = newText;
                      });
                    },
                    controller: emergencyContactNumberController,
                    hintText: 'Emergency Contact Number',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        medicalCondition = newText;
                      });
                    },
                    controller: medicalConditionController,
                    hintText: 'Medical Conditions',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MySmallButton(
                  onTap: () {
                    addPatient();
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
