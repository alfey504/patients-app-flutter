import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:we_care/api/models/LoginResponse.dart';
import 'dart:convert';

import 'package:we_care/api/models/register_response.dart';

class ApiService {
  Future<LoginData> loginUser(String username, String password) async {
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final uri = Uri.parse(
        'https://we-care-centennial.herokuapp.com/wecare/login?username=$username&password=$password');
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      try {
        final loginResponse = LoginData.fromJson(jsonDecode(response.body));
        // final loginResponse = LoginData(token: "ss");
        return loginResponse;
      } on Exception catch (_, e) {
        throw Exception('Incorrect Username or password');
      }
    } else {
      throw Exception('Api call failed');
    }
  }

  Future<RegisterData> registerUser(
      String username, String email, String password) async {
    final uri =
        Uri.parse("https://we-care-centennial.herokuapp.com/wecare/user");
    final jsonBody = jsonEncode(
        {'username': username, 'email': email, 'password': password});
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};

    final response = await http.post(uri, headers: headers, body: jsonBody);

    if (response.statusCode == 200) {
      try {
        final registerResponse =
            RegisterData.fromJson(jsonDecode(response.body));
        return registerResponse;
      } on Exception catch (_, e) {
        throw Exception("incorrect username or password");
      }
    } else {
      throw Exception("Error calling the api");
    }
  }
}
