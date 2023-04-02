import 'dart:ffi';

import 'package:we_care/api/models/add_patient_response.dart';
import 'package:we_care/api/models/records_model.dart';

class PatientRecordJoin {
  final RecordsModel record;
  final PatientDataModel patient;

  PatientRecordJoin({required this.record, required this.patient});
}
