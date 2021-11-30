import 'package:final_app/controller/history_controller.dart';
import 'package:final_app/model/history_model.dart';
import 'package:final_app/service/history_services.dart';

import 'package:flutter/material.dart';

import '../main.dart';

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Services? services;
  HistoryController? controller;
  List<CalHistory> histories = List.empty();
  bool isLoading = false;
 
  @override
  void initState() {
    super.initState();
    services = HistoryServices();
    controller = HistoryController(services!);
    controller!.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
    getHistory();
  }

  void getHistory() async {
    var newhistories = await controller!.fectHistory();

    setState(() {
      histories = newhistories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),

      body: ListView.separated(
        padding: EdgeInsets.all(10.0),
        itemCount: histories.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10),
        itemBuilder: (BuildContext context, index) {
          CalHistory newhistories = histories[index];
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            tileColor: buttonsBackgroundColor,
            title: Text(newhistories.calHistory,
              style: TextStyle(color: Colors.grey[400]),
            ),
            subtitle: Text(newhistories.resultHistory,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
