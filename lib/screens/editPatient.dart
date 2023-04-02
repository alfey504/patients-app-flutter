import 'package:flutter/material.dart';
import 'package:we_care/api/models/add_patient_response.dart';
import 'package:we_care/api/services/patient_service.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/smallbuttons.dart';
import 'package:we_care/main.dart';

class EditPatient extends StatefulWidget {
  const EditPatient({super.key});

  @override
  State<EditPatient> createState() => _EditPatientState();
}

class _EditPatientState extends State<EditPatient> {
  late MutablePatientDataModel patientData;
  bool initSet = false;
  void registerUser() {}

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!initSet) {
      final data =
          ModalRoute.of(context)!.settings.arguments as PatientDataModel;
      patientData = MutablePatientDataModel.fromPatientDataModel(data);

      patientNameController.text = patientData.patientName;
      ageController.text = patientData.age;
      dobController.text = patientData.dob;
      statusController.text = patientData.status;
      addressController.text = patientData.address;
      postalCodeController.text = patientData.postalCode;
      allergiesController.text = patientData.allergies;
      emergencyContactNameController.text = patientData.emergencyContactName;
      emergencyContactNumberController.text =
          patientData.emergencyContactNumber;
      medicalConditionController.text = patientData.medicalCondition;
      initSet = true;
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
      if (patientData.patientName.isEmpty) {
        showAlertDialog(
            context, "Missing Fields", "Please enter your full name");
        return false;
      }
      if (patientData.age.isEmpty || !isANumber(patientData.age)) {
        showAlertDialog(context, "Missing Fields", "Invalid age");
        return false;
      }
      if (patientData.dob.isEmpty) {
        showAlertDialog(
            context, "Missing Fields", "Please enter a date of birth");
        return false;
      }
      if (patientData.status.isEmpty) {
        showAlertDialog(context, "Missing Fields", "Please enter a Status");
        return false;
      } else if (patientData.status != "Critical" &&
          patientData.status != "Non Critical") {
        showAlertDialog(context, "Invalid Status",
            "Status can only be either Critical or Non Critical");
        return false;
      }
      if (patientData.address.isEmpty) {
        showAlertDialog(context, "Missing Fields", "Please enter a Address");
        return false;
      }
      if (patientData.postalCode.isEmpty) {
        showAlertDialog(
            context, "Missing Fields", "Please enter a postal code");
        return false;
      }
      if (patientData.allergies.isEmpty) {
        showAlertDialog(context, "Missing Fields", "Please enter a allergies");
        return false;
      }
      if (patientData.emergencyContactName.isEmpty) {
        showAlertDialog(
            context, "Missing Fields", "Please enter a Emergency Contact Name");
        return false;
      }
      if (patientData.emergencyContactNumber.isEmpty) {
        showAlertDialog(context, "Missing Fields",
            "Please enter a Emergency Contact Number");
        return false;
      }
      if (patientData.medicalCondition.isEmpty) {
        showAlertDialog(
            context, "Missing Fields", "Please enter a Medical Condition");
        return false;
      }

      return true;
    }

    void editPatient() {
      if (!verifyInputs()) {
        return;
      }
      final patientService = PatientService();
      final response =
          patientService.editPatientData(patientData.toPatientDataModel());

      response.then((value) {
        Navigator.pushNamed(context, '/onepatient', arguments: value);
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
                const SizedBox(height: 8.0),
                const Icon(
                  Icons.supervised_user_circle_outlined,
                  size: 70,
                ),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        patientData.patientName = newText;
                      });
                    },
                    controller: patientNameController,
                    hintText: 'First and Last Name',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        patientData.age = newText;
                      });
                    },
                    controller: ageController,
                    hintText: 'Age',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        patientData.dob = newText;
                      });
                    },
                    controller: dobController,
                    hintText: 'Birthday',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        patientData.status = newText;
                      });
                    },
                    controller: statusController,
                    hintText: 'Status',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        patientData.address = newText;
                      });
                    },
                    controller: addressController,
                    hintText: 'Address',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        patientData.postalCode = newText;
                      });
                    },
                    controller: postalCodeController,
                    hintText: 'Postal Code',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        patientData.allergies = newText;
                        print(patientData.allergies);
                      });
                    },
                    controller: allergiesController,
                    hintText: 'Allergies',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        patientData.emergencyContactName = newText;
                      });
                    },
                    controller: emergencyContactNameController,
                    hintText: 'Emergency Contact Name',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        patientData.emergencyContactNumber = newText;
                      });
                    },
                    controller: emergencyContactNumberController,
                    hintText: 'Emergency Contact Number',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newText) {
                      setState(() {
                        patientData.medicalCondition = newText;
                      });
                    },
                    controller: medicalConditionController,
                    hintText: 'Medical Conditions',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MySmallButton(
                  onTap: () {
                    editPatient();
                  },
                  buttonTitle: "Save",
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
