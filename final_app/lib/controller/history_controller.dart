import 'dart:async';

import 'package:final_app/model/history_model.dart';
import 'package:final_app/service/history_services.dart';


class HistoryController {
  final Services services;
  List<CalHistory> histories = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  HistoryController(this.services);

  Future<List<CalHistory>> fectHistory() async {
    onSyncController.add(true);
    histories = await services.getHistory();
    onSyncController.add(false);
    return histories;
  } 

  // Future<void> addHistory(String calHistory, String resultHistory) async {
  //   await services.addHistory(calHistory, resultHistory);
  // }
} 