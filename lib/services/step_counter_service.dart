import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:said/config/api_constants.dart';
import 'package:said/services/models/step_counter.dart';
import 'package:said/utils/flatten_api_response.dart';

class StepCounterService {
  static Future<List<StepCounter>> getAllStepCounters(int userId) async {
    final response = await http.get(
        Uri.parse(
            '${ApiConstants.baseUrl}${ApiConstants.stepCountersEndpoint}?user=$userId'),
        headers: <String, String>{
          'Authorization': 'Bearer ${dotenv.env['API_KEY']}'
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseStepCounters(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Announcements');
    }
  }

  static Future<StepCounter> getStepCounter(
      int userId, DateTime targetDate) async {
    final response = await http.get(
        Uri.parse(
            '${ApiConstants.baseUrl}${ApiConstants.stepCountersEndpoint}?user=$userId&date=$targetDate'),
        headers: <String, String>{
          'Authorization': 'Bearer ${dotenv.env['API_KEY']}'
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return StepCounter.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Ste');
    }
  }

  static Future<http.Response> addStepCounter(StepCounter stepCounter) {
    return http.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.stepCountersEndpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${dotenv.env['API_KEY']}'
        },
        body: jsonEncode({"data": stepCounter}));
  }

  static Future<http.Response> updateStepCounter(StepCounter stepCounter) {
    return http.put(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.stepCountersEndpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${dotenv.env['API_KEY']}'
        },
        body: jsonEncode({"data": stepCounter}));
  }

  // helper method:
  static List<StepCounter> parseStepCounters(String responseBody) {
    // flatten data:
    var flattenedResponse = flattenApiResponse(responseBody);

    // map data to list of announcements:
    var lst = flattenedResponse.map((e) => StepCounter.fromJson(e)).toList();
    return lst;
  }
}
