import 'dart:convert';
import 'package:ginger/models/app_exception.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  
  final String _baseUrl = 'https://api.jikan.moe/v3';
  
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url, headers: {'Accept': 'application/json'});
      responseJson = _returnResponse(response);
    } on Exception {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}'
        );
    }
  }
}