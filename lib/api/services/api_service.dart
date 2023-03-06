import 'package:http/http.dart' as http;
import 'package:we_care/api/models/LoginResponse.dart';
import 'dart:convert';

class ApiService {
  Future<List<LoginData>> loginUser(String username, String password) async {
    var url = Uri.parse('http://192.168.2.237:8000/api/users/login');
    var headers = {'Content-Type': 'application/json'};
    var jsonBody = json.encode({'userName': username, 'password': password});

    final response = await http.post(url, headers: headers, body: jsonBody);

    print(response.body);

    if (response.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if (loginResponse.success == 1) {
        return loginResponse.loginData;
      } else {
        throw Exception('Incorrect Username or password');
      }
    } else {
      throw Exception('Api call failed');
    }
  }
}
