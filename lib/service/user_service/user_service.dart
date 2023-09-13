import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  String url = "4f55-2407-0-3002-4341-df86-103d-7ca3-43dd.ngrok-free.app";
  String? token;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(
          "https://${url}/auth/login",
        ),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var obj = json.decode(response.body);
      print(obj);
      if (response.statusCode == 200) {
        token = obj['token'];
        print(token);
      }
      return response.statusCode == 200;
    } on Exception catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<http.Response> register({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String birth_of_day,
  }) async {
    print("https://${url}/auth/register");
    try {
      var response = await http.post(
        Uri.parse(
          "https://${url}/auth/register",
        ),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "gender": gender,
          "birth_of_day": birth_of_day,
        }),
      );

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("gagal register");
      }
      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<http.Response?> getRequest() async {
    try {
      var response = await http.get(
        Uri.parse('https://${url}/auth/me'),
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiZGQ0ZTA3YjgtY2QzMS00OGY4LTg3NDgtYWViMzQ0OWM4MDE3IiwicGVybWlzc2lvbnMiOltdLCJpYXQiOjE2OTQzNjQxMDEsImV4cCI6MTY5NDcyNDEwMX0.v_1WUzLNdH-5mhr5kVo6AWFpR9t8OVlLP0LB_NpNDeU',
        },
      );
      print('Bearer $token');
      print(response);
      print(token);
      if (response.statusCode == 200) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
      return response;
    } catch (e) {
      throw e;
    }
  }
}
