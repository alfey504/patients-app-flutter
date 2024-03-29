import 'package:flutter/material.dart';
import 'package:we_care/api/models/add_patient_response.dart';
import 'package:we_care/api/models/records_model.dart';
import 'package:we_care/api/services/records_service.dart';
import 'package:we_care/components/my_textfield.dart';
import 'package:we_care/components/smallbuttons.dart';
import 'package:we_care/main.dart';
import 'package:we_care/user/user_auth.dart';

class AddRecord extends StatefulWidget {
  AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  final dateController = TextEditingController();
  final typeController = TextEditingController();
  final valueController = TextEditingController();

  late PatientDataModel patientData;

  String date = "";
  String type = "";
  String value = "";

  bool verifyInputs() {
    if (date.isEmpty) {
      showAlertDialog(context, "Field Missing", "Missing date");
      return false;
    }
    if (type.isEmpty) {
      showAlertDialog(context, "Field Missing", "Missing type");
      return false;
    }
    if (value.isEmpty) {
      showAlertDialog(context, "Field Missing", "Missing value");
      return false;
    }
    return true;
  }

  void addRecord() {
    if (verifyInputs()) {
      RecordsModel record = RecordsModel(
          date: date,
          type: type,
          value: value,
          recordLink: patientData.recordLink);
      final RecordService recordService = RecordService();
      if (!UserAuth.isAuthorized()) {
        showAlertDialog(context, "Not Logged in", "Please log in");
        return;
      }
      final response =
          recordService.addRecord(record, UserAuth.token!, UserAuth.password!);
      response.then((value) {
        Navigator.pushNamed(context, '/records', arguments: patientData);
      }).catchError((error) {
        showAlertDialog(context, "Error", error.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    patientData =
        ModalRoute.of(context)!.settings.arguments as PatientDataModel;

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
                        date = newText;
                      });
                    },
                    controller: dateController,
                    hintText: 'Date',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newValue) {
                      setState(() {
                        type = newValue;
                      });
                    },
                    controller: typeController,
                    hintText: 'record type',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MyTextField(
                    onChange: (String newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                    controller: valueController,
                    hintText: 'Value',
                    obscureText: false),
                const SizedBox(height: 8.0),
                MySmallButton(
                  onTap: () {
                    addRecord();
                  },
                  buttonTitle: "Add New Record",
                  bckgColor: Colors.white,
                  buttonFontColor: Colors.black,
                ),
                const SizedBox(height: 8.0),
                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/records',
                        arguments: patientData);
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
