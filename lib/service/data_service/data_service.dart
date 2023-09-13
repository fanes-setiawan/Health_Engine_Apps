import 'package:http/http.dart' as http;

class DataService {
  Future<http.Response?> getDataPredicton() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://e8dc-114-5-16-98.ngrok-free.app/health/7f2dcf13-bf30-4282-914e-d2183b143482/prediction",
        ),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<http.Response?> getDataDetail() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://e8dc-114-5-16-98.ngrok-free.app/health/7f2dcf13-bf30-4282-914e-d2183b143482/detail",
        ),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<http.Response?> getDataAnalysis() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://e8dc-114-5-16-98.ngrok-free.app/health/c978755f-fe35-4cac-beeb-f0830d98e5c5/prevention",
        ),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
