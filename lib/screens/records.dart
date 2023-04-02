import 'package:flutter/material.dart';
import 'package:we_care/api/models/add_patient_response.dart';
import 'package:we_care/api/models/patien_record_join_model.dart';
import 'package:we_care/api/models/records_model.dart';
import 'package:we_care/api/services/records_service.dart';
import 'package:we_care/components/record_list.dart';

import 'package:we_care/components/smallbuttons.dart';
import 'package:we_care/components/patient.dart';
import 'package:we_care/main.dart';

class AllRecords extends StatefulWidget {
  AllRecords({super.key});

  @override
  State<AllRecords> createState() => _AllRecordsState();
}

class _AllRecordsState extends State<AllRecords> {
  final _firstController = ScrollController();

  late PatientDataModel patientData;

  late Future<List<RecordsModel>> futureRecordsList;

  void findPatient(BuildContext context) {
    Navigator.pushNamed(context, '/onepatient', arguments: patientData);
  }

  void deleteRecords(BuildContext context) {
    final recordService = RecordService();
    final response = recordService.deleteAllPatients(patientData.recordLink);

    response.then((value) {
      showAlertDialog(context, "Success", "Deleted all records successfully");
      setState(() {});
    }).catchError((error) {
      showAlertDialog(context, "Failed", "Failed to delete records");
    });
  }

  @override
  Widget build(BuildContext context) {
    patientData =
        ModalRoute.of(context)!.settings.arguments as PatientDataModel;
    final recordService = RecordService();
    futureRecordsList = recordService.getAllPatients(patientData.recordLink);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 35.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                MySmallButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/onepatient',
                          arguments: patientData);
                    },
                    buttonTitle: "Home",
                    bckgColor: Colors.black,
                    buttonFontColor: Colors.white),
                MySmallButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/add_record',
                          arguments: patientData);
                    },
                    buttonTitle: "Add",
                    bckgColor: const Color.fromARGB(255, 108, 171, 123),
                    buttonFontColor: const Color.fromARGB(255, 255, 255, 255)),
                MySmallButton(
                    onTap: () {
                      deleteRecords(context);
                    },
                    buttonTitle: "Delete",
                    bckgColor: const Color.fromARGB(255, 164, 56, 56),
                    buttonFontColor: const Color.fromARGB(255, 255, 255, 255)),
              ],
            ),
            const SizedBox(height: 16.0),
            FutureBuilder(
                future: futureRecordsList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RecordList(
                        onTap: (record) {
                          final patientRecoed = PatientRecordJoin(
                              record: record, patient: patientData);
                          Navigator.pushNamed(context, '/edit_record',
                              arguments: patientRecoed);
                        },
                        recordList: snapshot.data!,
                        bckgColor: Colors.white,
                        buttonFontColor: Colors.black);
                  } else if (snapshot.hasError) {
                    return Patient(
                        onTap: () {},
                        patientName: "Unable to fetch data",
                        patientId: "1",
                        bckgColor: Colors.black,
                        buttonFontColor: Colors.white);
                  }
                  return const CircularProgressIndicator();
                }),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
