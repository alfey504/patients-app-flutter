import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:we_care/api/models/add_patient_response.dart';
import 'dart:convert';

import 'package:we_care/user/user_auth.dart';

class PatientService {
  Future<PatientDataModel> addPatient(
      String patientName,
      String age,
      String dob,
      String status,
      String address,
      String city,
      String postalCode,
      String allergies,
      String emergencyContactName,
      String emergencyContactNumber,
      String medicalCondition) async {
    final uri =
        Uri.parse("https://we-care-centennial.herokuapp.com/wecare/patient");

    if (!UserAuth.isAuthorized()) {
      throw Exception("User not authorized");
    }

    final jsonBody = jsonEncode({
      'PatientName': patientName,
      'Age': age,
      'DOB': dob,
      "Status": status,
      "Address": address,
      "City": city,
      "PostalCode": postalCode,
      "Allergies": allergies,
      "EmergencyContactName": emergencyContactName,
      "EmergencyContactNumber": emergencyContactNumber,
      "MedicalCondition": medicalCondition,
      "token": UserAuth.token,
      "password": UserAuth.password
    });

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};

    final response = await http.post(uri, headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      try {
        final registerResponse =
            PatientDataModel.fromJson(jsonDecode(response.body));
        return registerResponse;
      } on Exception catch (_, e) {
        throw Exception("incorrect username or password");
      }
    } else {
      throw Exception("Error calling the api");
    }
  }

  Future<List<PatientDataModel>> getAllPatients() async {
    if (!UserAuth.isAuthorized()) {
      throw Exception("Not authorized");
    }

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final uri = Uri.parse(
        "https://we-care-centennial.herokuapp.com/wecare/patient?token=${UserAuth.token}&password=${UserAuth.password}");

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> rawList = jsonDecode(response.body);
      final List<PatientDataModel> encodedList =
          rawList.map((patient) => PatientDataModel.fromJson(patient)).toList();
      return encodedList;
    } else {
      throw Exception("Api call failed");
    }
  }

  Future<List<PatientDataModel>> getAllCriticalPatients() async {
    if (!UserAuth.isAuthorized()) {
      throw Exception("Not authorized");
    }

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final uri = Uri.parse(
        "https://we-care-centennial.herokuapp.com/wecare/critical?token=${UserAuth.token}&password=${UserAuth.password}");

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> rawList = jsonDecode(response.body);
      final List<PatientDataModel> encodedList =
          rawList.map((patient) => PatientDataModel.fromJson(patient)).toList();
      return encodedList;
    } else {
      throw Exception("Api call failed");
    }
  }

  Future<bool> deletePatientById(String id) async {
    if (!UserAuth.isAuthorized()) {
      throw Exception("Not Authorized");
    }

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final uri = Uri.parse(
        "https://we-care-centennial.herokuapp.com/wecare/patient/${id}?token=${UserAuth.token}&password=${UserAuth.password}");

    final response = await http.delete(uri, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Api call failed");
    }
  }

  Future<PatientDataModel> editPatientData(PatientDataModel patientData) async {
    if (!UserAuth.isAuthorized()) {
      throw Exception("User not authorized");
    }

    final jsonBody = jsonEncode({
      'id': patientData.id,
      'record_link': patientData.recordLink,
      'PatientName': patientData.patientName,
      'Age': patientData.age,
      'DOB': patientData.dob,
      "Status": patientData.status,
      "Address": patientData.address,
      "City": patientData.city,
      "PostalCode": patientData.postalCode,
      "Allergies": patientData.allergies,
      "EmergencyContactName": patientData.emergencyContactName,
      "EmergencyContactNumber": patientData.emergencyContactNumber,
      "MedicalCondition": patientData.medicalCondition,
      "token": UserAuth.token,
      "password": UserAuth.password
    });

    final uri = Uri.parse(
        "https://we-care-centennial.herokuapp.com/wecare/patient/${patientData.id}");
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};

    final response = await http.patch(uri, headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      try {
        final registerResponse =
            PatientDataModel.fromJson(jsonDecode(response.body));
        return registerResponse;
      } on Exception catch (_, e) {
        throw Exception("Issue editing data");
      }
    } else {
      throw Exception("Error calling the api");
    }
  }

  Future<List<PatientDataModel>> findPatientByName(String name) async {
    if (!UserAuth.isAuthorized()) {
      throw Exception("Not authorized");
    }

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final uri = Uri.parse(
        "https://we-care-centennial.herokuapp.com/wecare/byname/${name}?token=${UserAuth.token}&password=${UserAuth.password}");

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> rawList = jsonDecode(response.body);
      final List<PatientDataModel> encodedList =
          rawList.map((patient) => PatientDataModel.fromJson(patient)).toList();
      return encodedList;
    } else {
      throw Exception("Api call failed");
    }
  }
}
