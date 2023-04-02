import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:we_care/api/models/add_patient_response.dart';
import 'package:we_care/api/models/patien_record_join_model.dart';
import 'package:we_care/api/models/records_model.dart';
import 'package:we_care/api/services/records_service.dart';
import 'package:we_care/main.dart';

import '../components/my_textfield.dart';
import '../components/smallbuttons.dart';
import '../user/user_auth.dart';

class EditRecord extends StatefulWidget {
  const EditRecord({super.key});

  @override
  State<EditRecord> createState() => _EditRecordState();
}

class _EditRecordState extends State<EditRecord> {
  late RecordsModel record;
  late PatientDataModel patient;

  String date = "";
  String type = "";
  String value = "";

  TextEditingController dateController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  bool initSet = false;

  void deleteRecord() {
    final recordsService = RecordService();
    final response = recordsService.deleteRecord(record.id!);

    response.then((value) {
      showAlertDialog(context, "Success", "Successfully deleted record");
      Navigator.pushNamed(context, '/records', arguments: patient);
    }).catchError((error) {
      showAlertDialog(context, "Failed", error.toString());
    });
  }

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

  void editRecord() {
    if (verifyInputs()) {
      RecordsModel newRecord = RecordsModel(
          date: date,
          type: type,
          value: value,
          recordLink: patient.recordLink,
          id: record.id);
      final RecordService recordService = RecordService();
      if (!UserAuth.isAuthorized()) {
        showAlertDialog(context, "Not Logged in", "Please log in");
        return;
      }
      final response = recordService.editRecord(newRecord);
      response.then((value) {
        Navigator.pushNamed(context, '/records', arguments: patient);
      }).catchError((error) {
        showAlertDialog(context, "Error", error.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!initSet) {
      final patientRecord =
          ModalRoute.of(context)!.settings.arguments as PatientRecordJoin;
      record = patientRecord.record;
      patient = patientRecord.patient;

      dateController.text = record.date;
      typeController.text = record.type;
      valueController.text = record.value;
      initSet = true;
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
                    editRecord();
                  },
                  buttonTitle: "Update Record",
                  bckgColor: Colors.greenAccent,
                  buttonFontColor: Colors.black,
                ),
                const SizedBox(height: 8.0),
                MySmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/records',
                        arguments: patient);
                  },
                  buttonTitle: "Go Back",
                  bckgColor: Colors.white,
                  buttonFontColor: Colors.black,
                ),
                const SizedBox(height: 8.0),
                MySmallButton(
                  onTap: () {
                    deleteRecord();
                  },
                  buttonTitle: "Delete Record",
                  bckgColor: Colors.redAccent,
                  buttonFontColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
