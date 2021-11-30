import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/model/history_model.dart';

abstract class Services {
  // Future<void> addHistory(String calHistory, String resultHistory);
  Future<List<CalHistory>> getHistory();
}

class HistoryServices extends Services {

  @override
  Future<List<CalHistory>> getHistory() async {
    QuerySnapshot snapshot =
      await FirebaseFirestore
      .instance
      .collection('cal_history')
      .get();

    AllHistoryList histories = AllHistoryList.fromSnapshot(snapshot);
    return histories.histories;

  }

  // @override
  // Future<void> addHistory(String calHistory, String resultHistory) {
  //     return FirebaseFirestore.instance
  //       .collection('cal_history')
  //       .add({
  //       'calHistory': calHistory,
  //       'resultHistory': resultHistory,
  //     });
  // }
}