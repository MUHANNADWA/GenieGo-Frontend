import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:http/http.dart' as http;

typedef Json = Map<String, dynamic>;

class AppHttpHelper {
  static const String _baseUrl = 'http://172.26.1.1:4567/api';
  // static const String _baseUrl = 'http://172.26.1.30:4567/api';
  // static const String _baseUrl = 'http://192.168.0.150:4567/api';

  static Map<String, String> getHeaders() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json ',
        'Authorization': AuthService.token,
      };

  // Helper method to make a GET request
  static Future<Json> get(String endpoint) async {
    log('token = ${AuthService.token}');

    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: getHeaders(),
    );
    return _handleResponse(response);
  }

  // Helper method to make a POST request
  static Future<Json> post(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: getHeaders(),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a PUT request
  static Future<Json> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: getHeaders(),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a DELETE request
  static Future<Json> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: getHeaders(),
    );
    return _handleResponse(response);
  }

  // Helper method to make a POST multipart request
  static Future<Json> postMultipart(
      String endpoint, Map<String, String> fields, File? file) async {
    final uri = Uri.parse('$_baseUrl/$endpoint');
    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(
          getHeaders()..addAll({'Content-Type': 'multipart/form-data'}));

    fields.forEach((key, value) => request.fields[key] = value);

    if (file != null) {
      final fileStream = http.MultipartFile.fromBytes(
        'icon',
        await file.readAsBytes(),
        filename: file.path.split('/').last,
      );
      request.files.add(fileStream);
    }

    log('Uploading file to $uri with fields: $fields');

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    return _handleResponse(response);
  }

  // Handle the HTTP response
  static Json _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception(
          '${json.decode(response.body)['message'] ?? 'Unexpected error occured'}');
    }
  }
}
