import 'package:cloud_firestore/cloud_firestore.dart';

class CalHistory {
  final String calHistory;
  final String resultHistory;

  CalHistory(this.calHistory, this.resultHistory);

  factory CalHistory.fromJson(
    Map<String, dynamic> json,
  ) {
    return CalHistory(
      json['calHistory'] as String,
      json['resultHistory'] as String,
    );
  }
}

class AllHistoryList {
  final List<CalHistory> histories;
  AllHistoryList(this.histories);

  factory AllHistoryList.fromJson(List<dynamic> json) {
    List<CalHistory> histories;

    histories = json.map((index) => CalHistory.fromJson(index)).toList();
    return AllHistoryList(histories);
  }

  factory AllHistoryList.fromSnapshot(QuerySnapshot s) {
    List<CalHistory> histories = s.docs.map((DocumentSnapshot ds) {
      return CalHistory.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllHistoryList(histories);
  }
}
