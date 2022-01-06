// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'package:case_study/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:case_study/models/departure_model.dart';

class DepartureProvider with ChangeNotifier {
  ResponseModel? responseModel;
  List<DepartureModel> _departures = [];

  List<DepartureModel> get departures {
    return [..._departures];
  }

  Future<ResponseModel?> fetchDepartures() async {
    final url = Uri.parse(
        'https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/departureTimes');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);

      print('///*** DEPARTURE RESPONSE: $extractedData');

      responseModel = ResponseModel.fromJson(extractedData);

      if (responseModel!.status == 200) {
        List<DepartureModel> loadedDepartures = [];
        for (var i in responseModel!.data) {
          loadedDepartures.add(DepartureModel.fromJson(i));
        }
        _departures = loadedDepartures;
        // adding departures from temporary list.
        notifyListeners();
      } else {
        _departures = []; //null
      }

      notifyListeners();

      return responseModel;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
