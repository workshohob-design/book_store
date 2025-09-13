import 'dart:convert';
import 'package:book_store/core/api/api.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  Future<String> singUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(Api.signUp),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "password": password, "name": name}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data["msg"];
      }

      throw data;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verify({required String email, required String otp}) async {
    try {
      final response = await http.post(
        Uri.parse(Api.verify),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "otp": otp}),
      );
      final data = await jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print("ok");
        // print("${"!" * 50}");
        return data["msg"];
      }
      // print(response.statusCode);
      // print("error");
      // print("${"!" * 50}");
      throw data;
    } catch (e, s) {
      // print(s);
      rethrow;
    }
  }

  Future<String> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(Api.logIn),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "password": password}),
      );
      final data = await jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print("ok");
        // print("${"!" * 50}");
        return data["access_token"];
      }
      // print(response.statusCode);
      // print("error");
      // print("${"!" * 50}");
      throw data;
    } catch (e, s) {
      // print(s);
      // print(s);
      rethrow;
    }
  }

  Future<String> forgetPassWord({required String email}) async {
    try {
      final response = await http.post(
        Uri.parse(Api.forgetPassWord),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email}),
      );
      final data = await jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print("ok");
        // print("${"!" * 50}");
        return data["msg"];
      }
      print(response.statusCode);
      // print("error");
      // print("${"!" * 50}");
      throw data;
    } catch (e, s) {
      // print(s);
      // print(a);
      rethrow;
    }
  }

  Future<String> forgetPWVerify({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(Api.forgetPassWordVerify),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email, "otp": otp}),
      );
      final data = await jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print("ok");
        // print("${"!" * 50}");
        return data["reset_token"];
      }
      print(response.statusCode);
      // print("error");
      // print("${"!" * 50}");
      throw data;
    } catch (e, s) {
      // print(s);
      // print(a);
      rethrow;
    }
  }
}
