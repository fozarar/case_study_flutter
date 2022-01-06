import 'dart:convert';

import 'package:case_study/models/response_model.dart';
import 'package:case_study/models/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TicketProvider with ChangeNotifier {
  TicketModel? _ticketDetails;
  ResponseModel? responseModel;

  TicketModel? get ticketDetails {
    return _ticketDetails; // return [..._ticketdetails] because its null..
  }

  Future<void> fetchTickets(String userId) async {
    final url = Uri.parse(
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/$userId/ticket");
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);

      print('/////TİCKETRESPONSE////: $extractedData');

      responseModel = ResponseModel.fromJson(extractedData);

      if (responseModel!.status != 200) {
        _ticketDetails = null;
        notifyListeners();
      } else {
        _ticketDetails = TicketModel.fromJson(responseModel!.data);
        notifyListeners();
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
