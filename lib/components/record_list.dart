import 'package:flutter/material.dart';
import 'package:we_care/api/models/add_patient_response.dart';
import 'package:we_care/api/models/records_model.dart';
import 'package:we_care/components/patient.dart';

class RecordList extends StatelessWidget {
  final List<RecordsModel> recordList;
  final Color bckgColor;
  final Color buttonFontColor;
  final Function(RecordsModel patient) onTap;

  const RecordList(
      {super.key,
      required this.onTap,
      required this.recordList,
      required this.bckgColor,
      required this.buttonFontColor});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: recordList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Patient(
                  onTap: () {
                    onTap(recordList[index]);
                  },
                  patientName:
                      "${recordList[index].date} - ${recordList[index].type} - ${recordList[index].value} ",
                  patientId: recordList[index].id!,
                  bckgColor: bckgColor,
                  buttonFontColor: buttonFontColor),
            );
          }),
    );
  }
}
