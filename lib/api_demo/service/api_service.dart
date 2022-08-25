import 'dart:convert';
 import 'package:architecture_demos/api_demo/model/task_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static final _headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer FDktb-DRI-h5yCii70-_t-FYZFIzm27TSvyuEplp_X8yeMkQQA"
  };
  static final Uri _baseUrl = Uri.parse('https://crudapi.co.uk/api/v1/todo');
  static Future<List<Items>> fetchAllTask() async {
    TaskModel taskModel = TaskModel();

    try {
      final response = await http.get(_baseUrl, headers: _headers);
      if (response.statusCode == 200) {
        taskModel = TaskModel.fromJson(json.decode(response.body));
        return taskModel.items!;
      }
    } catch (e) {
      debugPrint("$e");
    }
    return [];
  }

  static Future createTask(
      {required String title, required bool taskStatus}) async {
    try {
      final response = await http.post(_baseUrl,
          headers: _headers,
          body: json.encode([
            {"title": title.toString(), "completed": taskStatus}
          ]));
      return response.statusCode;
    } catch (e) {
      debugPrint('$e');
    }
  }

  static Future deleteTask({required String uuid}) async {
    try {
      final response = await http.delete(_baseUrl,
          headers: _headers,
          body: json.encode([
            {"_uuid": uuid}
          ]));
      return response.statusCode;
    } catch (e) {
      debugPrint('$e');
    }
  }

  static Future editTask(
      {required String uuid,
      required String title,
      required bool taskStatus}) async {
    try {
      final response = await http.put(_baseUrl,
          headers: _headers,
          body: json.encode([
            {"_uuid": uuid, "completed": taskStatus, "title": title}
          ]));
      return response.statusCode;
    } catch (e) {
      debugPrint('$e');
    }
  }
}
