import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:we_care/api/models/records_model.dart';

import '../../user/user_auth.dart';
import '../models/add_patient_response.dart';

class RecordService {
  Future<RecordsModel> addRecord(
      RecordsModel record, String token, String password) async {
    final uri =
        Uri.parse("https://we-care-centennial.herokuapp.com/wecare/record");

    if (!UserAuth.isAuthorized()) {
      throw Exception("User not authorized");
    }

    final jsonBody = jsonEncode({
      "date": record.date,
      "type": record.type,
      "value": record.value,
      "record_link": record.recordLink,
      "token": UserAuth.token,
      "password": UserAuth.password
    });

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};

    final response = await http.post(uri, headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      try {
        final recordResponse = RecordsModel.fromJson(jsonDecode(response.body));
        return recordResponse;
      } on Exception catch (_, e) {
        print("Here");
        throw Exception("Api call failed");
      }
    } else {
      print("Here next");
      throw Exception("Error calling the api");
    }
  }

  Future<List<RecordsModel>> getAllPatients(String recordLink) async {
    if (!UserAuth.isAuthorized()) {
      throw Exception("Not authorized");
    }

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final uri = Uri.parse(
        "https://we-care-centennial.herokuapp.com/wecare/records?record_link=${recordLink}&token=${UserAuth.token}&password=${UserAuth.password}");

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> rawList = jsonDecode(response.body);
      final List<RecordsModel> encodedList =
          rawList.map((patient) => RecordsModel.fromJson(patient)).toList();
      return encodedList;
    } else {
      throw Exception("Api call failed");
    }
  }

  Future<List<RecordsModel>> deleteAllPatients(String recordLink) async {
    if (!UserAuth.isAuthorized()) {
      throw Exception("Not authorized");
    }

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final uri =
        Uri.parse("https://we-care-centennial.herokuapp.com/wecare/records");

    final jsonBody = jsonEncode({
      "record_link": recordLink,
      "token": UserAuth.token,
      "password": UserAuth.password
    });

    final response = await http.delete(uri, headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      final List<dynamic> rawList = jsonDecode(response.body);
      final List<RecordsModel> encodedList =
          rawList.map((patient) => RecordsModel.fromJson(patient)).toList();
      return encodedList;
    } else {
      throw Exception("Api call failed");
    }
  }

  Future<bool> deleteRecord(String id) async {
    if (!UserAuth.isAuthorized()) {
      throw Exception("Not authorized");
    }

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final uri = Uri.parse(
        "https://we-care-centennial.herokuapp.com/wecare/record/${id}");

    final jsonBody =
        jsonEncode({"token": UserAuth.token, "password": UserAuth.password});

    final response = await http.delete(uri, headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Api call failed");
    }
  }

  Future<RecordsModel> editRecord(RecordsModel record) async {
    final uri = Uri.parse(
        "https://we-care-centennial.herokuapp.com/wecare/record/${record.id!}");

    if (!UserAuth.isAuthorized()) {
      throw Exception("Not authorized");
    }

    final jsonBody = jsonEncode({
      "date": record.date,
      "type": record.type,
      "value": record.value,
      "record_link": record.recordLink,
      "token": UserAuth.token,
      "password": UserAuth.password
    });

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};

    final response = await http.patch(uri, headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      try {
        final recordResponse = RecordsModel.fromJson(jsonDecode(response.body));
        return recordResponse;
      } on Exception catch (_, e) {
        throw Exception("Api call failed");
      }
    } else {
      throw Exception("Error calling the api");
    }
  }
}
